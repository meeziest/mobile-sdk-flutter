import 'package:grpc/grpc.dart';

class CallOptionsBuilder {
  late String? _deviceId;
  late String _clientToken;
  late String _accessToken;

  CallOptionsBuilder setDeviceId(String? deviceId) {
    _deviceId = deviceId;
    return this;
  }

  CallOptionsBuilder setClientToken(String clientToken) {
    _clientToken = clientToken;
    return this;
  }

  CallOptionsBuilder setAccessToken(String accessToken) {
    _accessToken = accessToken;
    return this;
  }

  CallOptions build() {
    final Map<String, String> metadata = {
      'x-portal-client': _clientToken,
      'x-portal-access': _accessToken,
    };
    if (_deviceId != null && _deviceId!.isNotEmpty) {
      metadata['x-portal-device'] = _deviceId!;
    }
    return CallOptions(metadata: metadata);
  }
}
