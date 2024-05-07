import 'package:webitel_portal_sdk/src/generated/portal/account.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/auth.pb.dart';

class TokenRequestBuilder {
  late String grantType;
  late List<String> responseType;
  late String appToken;
  late Identity identity;

  TokenRequestBuilder setGrantType(String grantType) {
    this.grantType = grantType;
    return this;
  }

  TokenRequestBuilder setResponseType(List<String> responseType) {
    this.responseType = responseType;
    return this;
  }

  TokenRequestBuilder setAppToken(String appToken) {
    this.appToken = appToken;
    return this;
  }

  TokenRequestBuilder setIdentity(Identity identity) {
    this.identity = identity;
    return this;
  }

  TokenRequest build() {
    return TokenRequest(
      grantType: grantType,
      responseType: responseType,
      appToken: appToken,
      identity: identity,
    );
  }
}
