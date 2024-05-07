import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:webitel_portal_sdk/src/backbone/constants.dart';
import 'package:webitel_portal_sdk/src/backbone/logger.dart';
import 'package:webitel_portal_sdk/src/builder/token_request_builder.dart';
import 'package:webitel_portal_sdk/src/builder/user_agent_builder.dart';
import 'package:webitel_portal_sdk/src/data/gateway/grpc_gateway.dart';
import 'package:webitel_portal_sdk/src/data/gateway/shared_preferences_gateway.dart';
import 'package:webitel_portal_sdk/src/database/database.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response_entity.dart';
import 'package:webitel_portal_sdk/src/domain/entities/user/user.dart';
import 'package:webitel_portal_sdk/src/domain/services/auth_service.dart';
import 'package:webitel_portal_sdk/src/generated/portal/account.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/customer.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/push.pb.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final DatabaseProvider _databaseProvider;
  final SharedPreferencesGateway _sharedPreferencesGateway;
  final GrpcGateway _grpcGateway;
  final log = CustomLogger.getLogger('AuthServiceImpl');

  AuthServiceImpl(
    this._databaseProvider,
    this._grpcGateway,
    this._sharedPreferencesGateway,
  );

  @override
  Future<ResponseEntity> login({
    required String baseUrl,
    required String clientToken,
    required String appToken,
    required String userAgent,
  }) async {
    log.info('Attempting to log in with base URL: $baseUrl');
    await _sharedPreferencesGateway.init();
    final deviceId = await getOrGenerateDeviceId();
    final userAgentString = buildUserAgent(userAgent: userAgent);

    log.info(
        'Initializing GRPC connection with device ID: $deviceId and user agent: $userAgentString');
    await _grpcGateway.init(
      baseUrl: baseUrl,
      clientToken: clientToken,
      deviceId: deviceId,
      userAgent: userAgentString,
    );

    final request = TokenRequestBuilder()
        .setGrantType('identity')
        .setResponseType(['user', 'token', 'chat'])
        .setAppToken(appToken)
        .setIdentity(
          Identity(
            name: 'Volodia Hunkalo',
            sub: 'Hunkalo acc2',
            iss: Constants.iss,
          ),
        )
        .build();

    try {
      final response = await _grpcGateway.customerStub.token(request);
      log.info(
          'Logged in successfully, saving user ID and setting access token');
      await _sharedPreferencesGateway.saveUserId(response.chat.user.id);

      _databaseProvider.writeUser(
        UserEntity(
          accessToken: response.accessToken,
          id: response.chat.user.id,
          clientToken: clientToken,
          deviceId: deviceId,
        ),
      );

      _grpcGateway.setAccessToken(response.accessToken);
      return ResponseEntity(status: ResponseStatus.success);
    } on GrpcError catch (err) {
      log.severe('GRPC Error during login: ${err.toString()}');
      return ResponseEntity(
          status: ResponseStatus.error,
          message: 'Failed to login: ${err.toString()}');
    } catch (err) {
      log.severe('Exception during login: ${err.toString()}');
      return ResponseEntity(
          status: ResponseStatus.error,
          message: 'Failed to login: ${err.toString()}');
    }
  }

  @override
  Future<ResponseEntity> registerDevice() async {
    log.info('Attempting to register device');
    try {
      await _grpcGateway.customerStub
          .registerDevice(RegisterDeviceRequest(push: DevicePush()));
      log.info('Device registered successfully');
      return ResponseEntity(status: ResponseStatus.success);
    } catch (err) {
      log.severe('Failed to register device: ${err.toString()}');
      return ResponseEntity(
          status: ResponseStatus.error,
          message: 'Failed to register device: ${err.toString()}');
    }
  }

  @override
  Future<ResponseEntity> logout() async {
    log.info('Attempting to logout');
    try {
      await _grpcGateway.customerStub.logout(LogoutRequest());
      log.info('Logged out successfully');
      return ResponseEntity(status: ResponseStatus.success);
    } catch (err) {
      log.severe('Failed to logout: ${err.toString()}');
      return ResponseEntity(
          status: ResponseStatus.error,
          message: 'Failed to logout: ${err.toString()}');
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

  String buildUserAgent({required String userAgent}) {
    final userAgentString = UserAgentBuilder(
      userAgent: userAgent,
      sdkName: Constants.sdkName,
      sdkVersion: Constants.sdkVersion,
    ).build();
    log.info('Built user agent: $userAgentString');
    return userAgentString;
  }
}
