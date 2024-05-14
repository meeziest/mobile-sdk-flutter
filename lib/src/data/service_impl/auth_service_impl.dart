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
import 'package:webitel_portal_sdk/src/data/client_impl.dart';
import 'package:webitel_portal_sdk/src/data/grpc/grpc_channel.dart';
import 'package:webitel_portal_sdk/src/data/shared_preferences/shared_preferences_gateway.dart';
import 'package:webitel_portal_sdk/src/domain/entities/client.dart' as client;
import 'package:webitel_portal_sdk/src/domain/entities/response.dart' as res;
import 'package:webitel_portal_sdk/src/domain/entities/response_status.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/generated/portal/account.pb.dart';
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
  Future<client.Client> initClient({
    required String url,
    required String appToken,
  }) async {
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

    return ClientImpl(
      url: url,
      appToken: appToken,
      call: CallManager(),
      chat: ChatManager(),
    );
  }

  @override
  Future<res.Response> login({
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

      return res.Response(status: ResponseStatus.success);
    } on GrpcError catch (err) {
      log.severe('GRPC Error during login: ${err.toString()}');

      return res.Response(
        status: ResponseStatus.error,
        message: 'Failed to login: ${err.toString()}',
      );
    } catch (err) {
      log.severe('Exception during login: ${err.toString()}');

      return res.Response(
        status: ResponseStatus.error,
        message: 'Failed to login: ${err.toString()}',
      );
    }
  }

  @override
  Future<res.Response> registerDevice() async {
    log.info('Attempting to register device');
    try {
      await _grpcChannel.customerStub
          .registerDevice(RegisterDeviceRequest(push: DevicePush()));
      log.info('Device registered successfully');

      return res.Response(status: ResponseStatus.success);
    } catch (err) {
      log.severe('Failed to register device: ${err.toString()}');

      return res.Response(
        status: ResponseStatus.error,
        message: 'Failed to register device: ${err.toString()}',
      );
    }
  }

  @override
  Future<res.Response> logout() async {
    log.info('Attempting to logout');
    try {
      await _grpcChannel.customerStub.logout(LogoutRequest());
      log.info('Logged out successfully');

      return res.Response(status: ResponseStatus.success);
    } catch (err) {
      log.severe('Failed to logout: ${err.toString()}');

      return res.Response(
        status: ResponseStatus.error,
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
      platform: platform,
      platformVersion: platformVersion,
      model: model,
      device: device,
      architecture: architecture,
    ).build();
    log.info('Built user agent: $userAgentString');

    return userAgentString;
  }
}
