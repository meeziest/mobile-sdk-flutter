class UserAgentBuilder {
  late String _userAgent;
  late String _sdkName;
  late String _sdkVersion;

  UserAgentBuilder({
    required String userAgent,
    required String sdkName,
    required String sdkVersion,
  }) {
    _userAgent = userAgent;
    _sdkName = sdkName;
    _sdkVersion = sdkVersion;
  }

  UserAgentBuilder setUserAgent(String userAgent) {
    _userAgent = userAgent;
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
    return '$_userAgent $_sdkName/$_sdkVersion';
  }
}
