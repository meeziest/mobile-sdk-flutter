import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import 'package:uuid/uuid.dart';
import 'package:webitel_portal_sdk/src/backbone/builder/token_request_builder.dart';
import 'package:webitel_portal_sdk/src/backbone/builder/user_agent_builder.dart';
import 'package:webitel_portal_sdk/src/backbone/constants.dart';
import 'package:webitel_portal_sdk/src/backbone/helper/uri_helper.dart';
import 'package:webitel_portal_sdk/src/backbone/logger.dart';
import 'package:webitel_portal_sdk/src/backbone/shared_preferences/shared_preferences_gateway.dart';
import 'package:webitel_portal_sdk/src/data/grpc/grpc_channel.dart';
import 'package:webitel_portal_sdk/src/data/portal_client_impl.dart';
import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/portal_client.dart'
    as client;
import 'package:webitel_portal_sdk/src/domain/entities/portal_response.dart'
    as res;
import 'package:webitel_portal_sdk/src/domain/entities/portal_response_status.dart';
import 'package:webitel_portal_sdk/src/domain/entities/user.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/generated/portal/account.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/connect.pb.dart'
    as portal;
import 'package:webitel_portal_sdk/src/generated/portal/customer.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/push.pb.dart';
import 'package:webitel_portal_sdk/src/managers/call.dart';
import 'package:webitel_portal_sdk/src/managers/chat.dart';

@LazySingleton(as: AuthService)
final class AuthServiceImpl implements AuthService {
  final SharedPreferencesGateway _sharedPreferencesGateway;
  final GrpcChannel _grpcChannel;
  final log = CustomLogger.getLogger('AuthServiceImpl');

  AuthServiceImpl(
    this._grpcChannel,
    this._sharedPreferencesGateway,
  );

  @override
  Future<client.PortalClient> initClient({
    required String url,
    required String appToken,
  }) async {
    try {
      log.info('Attempting to init gRPC channel for: $url');

      await _sharedPreferencesGateway.init();
      await _sharedPreferencesGateway.saveAppToken(appToken);
      final deviceId = await getOrGenerateDeviceId();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final uaData = await userAgentData();

      final userAgentString = buildUserAgent(
        appName: packageInfo.appName,
        appVersion: packageInfo.version,
        platform: Platform.operatingSystem,
        platformVersion: uaData.platformVersion,
        model: uaData.model,
        device: uaData.device,
        architecture: uaData.architecture,
      );

      final urlHelper = UrlHelper(url);
      final secureConnection = urlHelper.isSecure();
      final hostUrl = urlHelper.getUrl();
      final port = urlHelper.getPort();

      log.info(
          'Initializing GRPC connection with device ID: $deviceId and user agent: $userAgentString');

      await _grpcChannel.init(
        url: hostUrl,
        appToken: appToken,
        deviceId: deviceId,
        userAgent: userAgentString,
        port: port,
        secure: secureConnection,
      );

      final String echoDataString = 'Channel init';
      final List<int> echoDataBytes = echoDataString.codeUnits;
      final echo = portal.Echo(data: echoDataBytes);
      await _grpcChannel.customerStub.ping(echo);
      log.info('Send initial ping to check channel validity');

      return PortalClientImpl(
        url: url,
        appToken: appToken,
        call: CallManager(),
        chat: ChatManager(),
      );
    } on GrpcError catch (err, trace) {
      log.severe(
        'Error occurred during gRPC channel initialization',
        err.message,
        trace,
      );
      return PortalClientImpl(
        error: CallError(
          errorMessage: err.message ?? '',
          statusCode: err.code.toString(),
        ),
        url: url,
        appToken: appToken,
        call: CallManager(),
        chat: ChatManager(),
      );
    }
  }

  @override
  Future<res.PortalResponse> login({
    required String name,
    required String sub,
    required String issuer,
    String? locale,
    String? email,
    bool? emailVerified,
    String? phoneNumber,
    bool? phoneNumberVerified,
  }) async {
    final appToken = await _sharedPreferencesGateway.readAppToken();

    final request = TokenRequestBuilder()
        .setGrantType('identity')
        .setResponseType(['user', 'token', 'chat'])
        .setAppToken(appToken ?? '')
        .setIdentity(
          Identity(
            name: name,
            sub: sub,
            iss: issuer,
            locale: locale,
            email: email,
            emailVerified: emailVerified,
            phoneNumber: phoneNumber,
            phoneNumberVerified: phoneNumberVerified,
          ),
        )
        .build();

    try {
      final response = await _grpcChannel.customerStub.token(request);
      log.info(
          'Logged in successfully, saving user ID and setting access token');

      await _sharedPreferencesGateway.saveUserId(response.chat.user.id);
      await _sharedPreferencesGateway.saveAccessToken(response.accessToken);

      _grpcChannel.setAccessToken(response.accessToken);

      return res.PortalResponse(status: PortalResponseStatus.success);
    } on GrpcError catch (err, trace) {
      log.severe(
        'GRPC Error during login',
        err,
        trace,
      );

      return res.PortalResponse(
        status: PortalResponseStatus.error,
        message: 'Failed to login: ${err.toString()}',
      );
    } catch (err, trace) {
      log.severe(
        'Exception during login',
        err,
        trace,
      );

      return res.PortalResponse(
        status: PortalResponseStatus.error,
        message: 'Failed to login: ${err.toString()}',
      );
    }
  }

  @override
  Future<res.PortalResponse> registerDevice({required String pushToken}) async {
    log.info('Attempting to register device');
    try {
      await _grpcChannel.customerStub.registerDevice(
        RegisterDeviceRequest(
          push: Platform.isIOS
              ? DevicePush(aPN: pushToken)
              : DevicePush(fCM: pushToken),
        ),
      );
      log.info('Device registered successfully');

      return res.PortalResponse(status: PortalResponseStatus.success);
    } catch (err, trace) {
      log.severe(
        'Failed to register device',
        err,
        trace,
      );

      return res.PortalResponse(
        status: PortalResponseStatus.error,
        message: 'Failed to register device: ${err.toString()}',
      );
    }
  }

  @override
  Future<res.PortalResponse> logout() async {
    log.info('Attempting to logout');
    try {
      await _grpcChannel.customerStub.logout(LogoutRequest());
      log.info('Logged out successfully');

      return res.PortalResponse(status: PortalResponseStatus.success);
    } catch (err, trace) {
      log.severe(
        'Failed to logout',
        err,
        trace,
      );

      return res.PortalResponse(
        status: PortalResponseStatus.error,
        message: 'Failed to logout: ${err.toString()}',
      );
    }
  }

  Future<String> getOrGenerateDeviceId() async {
    String? savedDeviceId = await _sharedPreferencesGateway.readDeviceId();
    if (savedDeviceId == null || savedDeviceId == 'null') {
      final String deviceIdGenerated = Uuid().v4();
      log.info('Generating new device ID: $deviceIdGenerated');
      await _sharedPreferencesGateway.saveDeviceId(deviceIdGenerated);
      return deviceIdGenerated;
    }
    log.info('Using existing device ID: $savedDeviceId');
    return savedDeviceId;
  }

  String buildUserAgent({
    required String appName,
    required String appVersion,
    required String platform,
    required String platformVersion,
    required String model,
    required String device,
    required String architecture,
  }) {
    final userAgentString = UserAgentBuilder(
      sdkName: Constants.sdkName,
      sdkVersion: Constants.sdkVersion,
      appName: appName,
      version: appVersion,
      platform: platform == 'android' ? 'Android' : platform,
      platformVersion: platformVersion,
      model: model,
      device: device,
      architecture: architecture,
    ).build();
    log.info('Built user agent: $userAgentString');

    return userAgentString;
  }

  @override
  Future<User> getUser() async {
    try {
      final token = await _grpcChannel.customerStub.inspect(InspectRequest());

      return User(
        name: token.user.identity.name,
        sub: token.user.identity.sub,
        issuer: token.user.identity.iss,
        id: token.chat.user.id,
        tokenExpiration: token.expiresIn,
      );
    } on GrpcError catch (err) {
      log.severe('GRPC Error while getting user', err.message);
      rethrow;
    } catch (err) {
      log.severe('Exception while getting user: ${err.toString()}');
      rethrow;
    }
  }
}
