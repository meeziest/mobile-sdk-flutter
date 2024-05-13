//
//  Generated code. Do not modify.
//  source: portal/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'account.pb.dart' as $11;
import 'messages.pb.dart' as $0;
import 'push.pb.dart' as $12;

/// Access Token Request
class TokenRequest extends $pb.GeneratedMessage {
  factory TokenRequest({
    $core.String? state,
    $core.Iterable<$core.String>? scope,
    $core.String? appToken,
    $core.String? grantType,
    $core.Iterable<$core.String>? responseType,
    $core.String? refreshToken,
    $11.Identity? identity,
    $core.String? code,
    $12.DevicePush? push,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    if (scope != null) {
      $result.scope.addAll(scope);
    }
    if (appToken != null) {
      $result.appToken = appToken;
    }
    if (grantType != null) {
      $result.grantType = grantType;
    }
    if (responseType != null) {
      $result.responseType.addAll(responseType);
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (code != null) {
      $result.code = code;
    }
    if (push != null) {
      $result.push = push;
    }
    return $result;
  }
  TokenRequest._() : super();
  factory TokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'state')
    ..pPS(2, _omitFieldNames ? '' : 'scope')
    ..aOS(3, _omitFieldNames ? '' : 'appToken')
    ..aOS(4, _omitFieldNames ? '' : 'grantType')
    ..pPS(5, _omitFieldNames ? '' : 'responseType')
    ..aOS(11, _omitFieldNames ? '' : 'refreshToken')
    ..aOM<$11.Identity>(12, _omitFieldNames ? '' : 'identity', subBuilder: $11.Identity.create)
    ..aOS(13, _omitFieldNames ? '' : 'code')
    ..aOM<$12.DevicePush>(21, _omitFieldNames ? '' : 'push', subBuilder: $12.DevicePush.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenRequest clone() => TokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenRequest copyWith(void Function(TokenRequest) updates) => super.copyWith((message) => updates(message as TokenRequest)) as TokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenRequest create() => TokenRequest._();
  TokenRequest createEmptyInstance() => create();
  static $pb.PbList<TokenRequest> createRepeated() => $pb.PbList<TokenRequest>();
  @$core.pragma('dart2js:noInline')
  static TokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenRequest>(create);
  static TokenRequest? _defaultInstance;

  /// RECOMMENDED. An opaque value used by the client to maintain
  /// state between the request and callback.  The authorization
  /// server includes this value when redirecting the user-agent back
  /// to the client.  The parameter SHOULD be used for preventing
  /// cross-site request forgery
  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  /// OPTIONAL. The scope of the access request
  /// Posible values are:
  /// * chat ; [I]nstant [M]essaging service
  /// * call ; [V]oice[o]ver[IP] SIP service
  @$pb.TagNumber(2)
  $core.List<$core.String> get scope => $_getList(1);

  /// REQUIRED. Confidential client authorization token.
  /// May be transmitted in header: X-Portal-Client.
  /// Keep it a secret.
  @$pb.TagNumber(3)
  $core.String get appToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set appToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAppToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppToken() => clearField(3);

  /// REQUIRED. Grant type.
  /// Posible values ; - not implemented ; + supported
  /// - authorization_code ; Authorization Code Grant
  /// - client_credentials ; Client Credentials Grant
  /// - refresh_token      ; Refreshing an Access Token
  /// - password           ; Resource Owner Password Credentials Grant
  /// Extension Grants
  /// + identity           ; Public end-User Identity Grant
  @$pb.TagNumber(4)
  $core.String get grantType => $_getSZ(3);
  @$pb.TagNumber(4)
  set grantType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGrantType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrantType() => clearField(4);

  /// REQUIRED. Response type.
  /// Posible values ; - not implemented ; + supported
  /// + token    ; Access token response
  /// - id_token ;
  /// Extensions
  /// + user     ; End-User account profile
  /// + call     ; SIP account credentials
  /// + chat     ; IM account details
  @$pb.TagNumber(5)
  $core.List<$core.String> get responseType => $_getList(4);

  /// Refresh token string to obtain NEW access token.
  /// REQUIRED. When grant_type is set to "refresh_token".
  @$pb.TagNumber(11)
  $core.String get refreshToken => $_getSZ(5);
  @$pb.TagNumber(11)
  set refreshToken($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(11)
  $core.bool hasRefreshToken() => $_has(5);
  @$pb.TagNumber(11)
  void clearRefreshToken() => clearField(11);

  /// Identity of the end-User account association.
  /// REQUIRED. When grant_type is set to "identity".
  @$pb.TagNumber(12)
  $11.Identity get identity => $_getN(6);
  @$pb.TagNumber(12)
  set identity($11.Identity v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasIdentity() => $_has(6);
  @$pb.TagNumber(12)
  void clearIdentity() => clearField(12);
  @$pb.TagNumber(12)
  $11.Identity ensureIdentity() => $_ensure(6);

  /// Authorization code grant.
  /// REQUIRED. When grant_type is set to "authorization_code".
  @$pb.TagNumber(13)
  $core.String get code => $_getSZ(7);
  @$pb.TagNumber(13)
  set code($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(13)
  $core.bool hasCode() => $_has(7);
  @$pb.TagNumber(13)
  void clearCode() => clearField(13);

  /// OPTIONAL. Sign up client device for PUSH notifications.
  @$pb.TagNumber(21)
  $12.DevicePush get push => $_getN(8);
  @$pb.TagNumber(21)
  set push($12.DevicePush v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasPush() => $_has(8);
  @$pb.TagNumber(21)
  void clearPush() => clearField(21);
  @$pb.TagNumber(21)
  $12.DevicePush ensurePush() => $_ensure(8);
}

/// Access Token Response
class AccessToken extends $pb.GeneratedMessage {
  factory AccessToken({
    $core.int? expiresIn,
    $core.String? tokenType,
    $core.String? accessToken,
    $core.String? refreshToken,
    $core.Iterable<$core.String>? scope,
    $core.String? state,
    $11.UserProfile? user,
    $11.CallAccount? call,
    $0.ChatAccount? chat,
  }) {
    final $result = create();
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    if (tokenType != null) {
      $result.tokenType = tokenType;
    }
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (scope != null) {
      $result.scope.addAll(scope);
    }
    if (state != null) {
      $result.state = state;
    }
    if (user != null) {
      $result.user = user;
    }
    if (call != null) {
      $result.call = call;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    return $result;
  }
  AccessToken._() : super();
  factory AccessToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccessToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccessToken', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'expiresIn', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'tokenType')
    ..aOS(3, _omitFieldNames ? '' : 'accessToken')
    ..aOS(4, _omitFieldNames ? '' : 'refreshToken')
    ..pPS(5, _omitFieldNames ? '' : 'scope')
    ..aOS(6, _omitFieldNames ? '' : 'state')
    ..aOM<$11.UserProfile>(21, _omitFieldNames ? '' : 'user', subBuilder: $11.UserProfile.create)
    ..aOM<$11.CallAccount>(22, _omitFieldNames ? '' : 'call', subBuilder: $11.CallAccount.create)
    ..aOM<$0.ChatAccount>(23, _omitFieldNames ? '' : 'chat', subBuilder: $0.ChatAccount.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccessToken clone() => AccessToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccessToken copyWith(void Function(AccessToken) updates) => super.copyWith((message) => updates(message as AccessToken)) as AccessToken;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessToken create() => AccessToken._();
  AccessToken createEmptyInstance() => create();
  static $pb.PbList<AccessToken> createRepeated() => $pb.PbList<AccessToken>();
  @$core.pragma('dart2js:noInline')
  static AccessToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessToken>(create);
  static AccessToken? _defaultInstance;

  /// RECOMMENDED. The lifetime in seconds of the access token.
  @$pb.TagNumber(1)
  $core.int get expiresIn => $_getIZ(0);
  @$pb.TagNumber(1)
  set expiresIn($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExpiresIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpiresIn() => clearField(1);

  /// REQUIRED. The type of the token issued. Value is case insensitive.
  @$pb.TagNumber(2)
  $core.String get tokenType => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenType() => clearField(2);

  /// REQUIRED. The access token issued by the authorization server.
  @$pb.TagNumber(3)
  $core.String get accessToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set accessToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccessToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccessToken() => clearField(3);

  /// OPTIONAL. The refresh token, which can be used to obtain
  /// new access tokens using the same authorization grant.
  @$pb.TagNumber(4)
  $core.String get refreshToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set refreshToken($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefreshToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefreshToken() => clearField(4);

  /// OPTIONAL, if identical to the scope requested by the client;
  /// otherwise, REQUIRED. The scope of the access token.
  @$pb.TagNumber(5)
  $core.List<$core.String> get scope => $_getList(4);

  /// REQUIRED if the "state" parameter was present in the client
  /// authorization request. The exact value received from the client.
  @$pb.TagNumber(6)
  $core.String get state => $_getSZ(5);
  @$pb.TagNumber(6)
  set state($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  /// End-User account profile.
  @$pb.TagNumber(21)
  $11.UserProfile get user => $_getN(6);
  @$pb.TagNumber(21)
  set user($11.UserProfile v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasUser() => $_has(6);
  @$pb.TagNumber(21)
  void clearUser() => clearField(21);
  @$pb.TagNumber(21)
  $11.UserProfile ensureUser() => $_ensure(6);

  /// VoIP / SIP service credentials.
  @$pb.TagNumber(22)
  $11.CallAccount get call => $_getN(7);
  @$pb.TagNumber(22)
  set call($11.CallAccount v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasCall() => $_has(7);
  @$pb.TagNumber(22)
  void clearCall() => clearField(22);
  @$pb.TagNumber(22)
  $11.CallAccount ensureCall() => $_ensure(7);

  /// [I]nstant [M]essaging dialog state.
  @$pb.TagNumber(23)
  $0.ChatAccount get chat => $_getN(8);
  @$pb.TagNumber(23)
  set chat($0.ChatAccount v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasChat() => $_has(8);
  @$pb.TagNumber(23)
  void clearChat() => clearField(23);
  @$pb.TagNumber(23)
  $0.ChatAccount ensureChat() => $_ensure(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
