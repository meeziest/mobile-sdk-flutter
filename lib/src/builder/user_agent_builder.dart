final class UserAgentBuilder {
  late String _appName;
  late String _version;
  late String _platform;
  late String _platformVersion;
  late String _model;
  late String _device;
  late String _architecture;
  late String _sdkName;
  late String _sdkVersion;

  // Constructor requiring all initial details for the user agent.
  UserAgentBuilder({
    required String appName,
    required String version,
    required String platform,
    required String platformVersion,
    required String model,
    required String device,
    required String architecture,
    required String sdkName,
    required String sdkVersion,
  }) {
    _appName = appName;
    _version = version;
    _platform = platform;
    _platformVersion = platformVersion;
    _model = model;
    _device = device;
    _architecture = architecture;
    _sdkName = sdkName;
    _sdkVersion = sdkVersion;
  }

  // Setters for each property
  UserAgentBuilder setAppName(String appName) {
    _appName = appName;
    return this;
  }

  UserAgentBuilder setVersion(String version) {
    _version = version;
    return this;
  }

  UserAgentBuilder setPlatform(String platform) {
    _platform = platform;
    return this;
  }

  UserAgentBuilder setPlatformVersion(String platformVersion) {
    _platformVersion = platformVersion;
    return this;
  }

  UserAgentBuilder setModel(String model) {
    _model = model;
    return this;
  }

  UserAgentBuilder setDevice(String device) {
    _device = device;
    return this;
  }

  UserAgentBuilder setArchitecture(String architecture) {
    _architecture = architecture;
    return this;
  }

  UserAgentBuilder setSdkName(String sdkName) {
    _sdkName = sdkName;
    return this;
  }

  UserAgentBuilder setSdkVersion(String sdkVersion) {
    _sdkVersion = sdkVersion;
    return this;
  }

  String build() {
    return '$_appName/$_version ($_platform $_platformVersion; $_model; $_device; $_architecture) $_sdkName/$_sdkVersion';
  }
}
