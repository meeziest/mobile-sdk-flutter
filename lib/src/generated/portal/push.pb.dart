//
//  Generated code. Do not modify.
//  source: portal/push.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum DevicePush_Token {
  fCM, 
  aPN, 
  web, 
  notSet
}

/// PUSH Subscription
/// https://core.telegram.org/api/push-updates#subscribing-to-notifications
class DevicePush extends $pb.GeneratedMessage {
  factory DevicePush({
    $core.String? fCM,
    $core.String? aPN,
    WebPush? web,
    $core.String? secret,
  }) {
    final $result = create();
    if (fCM != null) {
      $result.fCM = fCM;
    }
    if (aPN != null) {
      $result.aPN = aPN;
    }
    if (web != null) {
      $result.web = web;
    }
    if (secret != null) {
      $result.secret = secret;
    }
    return $result;
  }
  DevicePush._() : super();
  factory DevicePush.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DevicePush.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DevicePush_Token> _DevicePush_TokenByTag = {
    1 : DevicePush_Token.fCM,
    2 : DevicePush_Token.aPN,
    10 : DevicePush_Token.web,
    0 : DevicePush_Token.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DevicePush', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..oo(0, [1, 2, 10])
    ..aOS(1, _omitFieldNames ? '' : 'FCM', protoName: 'FCM')
    ..aOS(2, _omitFieldNames ? '' : 'APN', protoName: 'APN')
    ..aOM<WebPush>(10, _omitFieldNames ? '' : 'web', subBuilder: WebPush.create)
    ..aOS(20, _omitFieldNames ? '' : 'secret')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DevicePush clone() => DevicePush()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DevicePush copyWith(void Function(DevicePush) updates) => super.copyWith((message) => updates(message as DevicePush)) as DevicePush;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DevicePush create() => DevicePush._();
  DevicePush createEmptyInstance() => create();
  static $pb.PbList<DevicePush> createRepeated() => $pb.PbList<DevicePush>();
  @$core.pragma('dart2js:noInline')
  static DevicePush getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DevicePush>(create);
  static DevicePush? _defaultInstance;

  DevicePush_Token whichToken() => _DevicePush_TokenByTag[$_whichOneof(0)]!;
  void clearToken() => clearField($_whichOneof(0));

  /// [F]irebase [C]loud [M]essaging Service (firebase token for google firebase)
  @$pb.TagNumber(1)
  $core.String get fCM => $_getSZ(0);
  @$pb.TagNumber(1)
  set fCM($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFCM() => $_has(0);
  @$pb.TagNumber(1)
  void clearFCM() => clearField(1);

  /// [A]pple [P]ush [N]otification Service (device token for apple push)
  @$pb.TagNumber(2)
  $core.String get aPN => $_getSZ(1);
  @$pb.TagNumber(2)
  set aPN($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAPN() => $_has(1);
  @$pb.TagNumber(2)
  void clearAPN() => clearField(2);

  /// For 10 web push, the token must be a JSON-encoded object with the following keys:
  /// endpoint: Absolute URL exposed by the push service where the application server can send push messages
  /// keys: P-256 elliptic curve Diffie-Hellman parameters in the following object
  /// p256dh: Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
  /// auth: Base64url-encoded authentication secret
  @$pb.TagNumber(10)
  WebPush get web => $_getN(2);
  @$pb.TagNumber(10)
  set web(WebPush v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasWeb() => $_has(2);
  @$pb.TagNumber(10)
  void clearWeb() => clearField(10);
  @$pb.TagNumber(10)
  WebPush ensureWeb() => $_ensure(2);

  /// For FCM and APNS VoIP, optional encryption key used to encrypt push notifications
  @$pb.TagNumber(20)
  $core.String get secret => $_getSZ(3);
  @$pb.TagNumber(20)
  set secret($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(20)
  $core.bool hasSecret() => $_has(3);
  @$pb.TagNumber(20)
  void clearSecret() => clearField(20);
}

/// keys: P-256 elliptic curve Diffie-Hellman parameters in the following object
/// p256dh: Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
/// auth: Base64url-encoded authentication secret
class WebPush_Key extends $pb.GeneratedMessage {
  factory WebPush_Key({
    $core.List<$core.int>? auth,
    $core.List<$core.int>? p256dh,
  }) {
    final $result = create();
    if (auth != null) {
      $result.auth = auth;
    }
    if (p256dh != null) {
      $result.p256dh = p256dh;
    }
    return $result;
  }
  WebPush_Key._() : super();
  factory WebPush_Key.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WebPush_Key.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WebPush.Key', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'auth', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'p256dh', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WebPush_Key clone() => WebPush_Key()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WebPush_Key copyWith(void Function(WebPush_Key) updates) => super.copyWith((message) => updates(message as WebPush_Key)) as WebPush_Key;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebPush_Key create() => WebPush_Key._();
  WebPush_Key createEmptyInstance() => create();
  static $pb.PbList<WebPush_Key> createRepeated() => $pb.PbList<WebPush_Key>();
  @$core.pragma('dart2js:noInline')
  static WebPush_Key getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WebPush_Key>(create);
  static WebPush_Key? _defaultInstance;

  /// auth: Base64url-encoded authentication secret
  @$pb.TagNumber(1)
  $core.List<$core.int> get auth => $_getN(0);
  @$pb.TagNumber(1)
  set auth($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuth() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuth() => clearField(1);

  /// p256dh: Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
  @$pb.TagNumber(2)
  $core.List<$core.int> get p256dh => $_getN(1);
  @$pb.TagNumber(2)
  set p256dh($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasP256dh() => $_has(1);
  @$pb.TagNumber(2)
  void clearP256dh() => clearField(2);
}

/// WebPUSH subscription
class WebPush extends $pb.GeneratedMessage {
  factory WebPush({
    $core.String? endpoint,
    WebPush_Key? key,
  }) {
    final $result = create();
    if (endpoint != null) {
      $result.endpoint = endpoint;
    }
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  WebPush._() : super();
  factory WebPush.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WebPush.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WebPush', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endpoint')
    ..aOM<WebPush_Key>(2, _omitFieldNames ? '' : 'key', subBuilder: WebPush_Key.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WebPush clone() => WebPush()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WebPush copyWith(void Function(WebPush) updates) => super.copyWith((message) => updates(message as WebPush)) as WebPush;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebPush create() => WebPush._();
  WebPush createEmptyInstance() => create();
  static $pb.PbList<WebPush> createRepeated() => $pb.PbList<WebPush>();
  @$core.pragma('dart2js:noInline')
  static WebPush getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WebPush>(create);
  static WebPush? _defaultInstance;

  /// endpoint: Absolute URL exposed by the push service where the application server can send push messages
  @$pb.TagNumber(1)
  $core.String get endpoint => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpoint($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEndpoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpoint() => clearField(1);

  /// P-256 elliptic curve Diffie-Hellman parameters
  @$pb.TagNumber(2)
  WebPush_Key get key => $_getN(1);
  @$pb.TagNumber(2)
  set key(WebPush_Key v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
  @$pb.TagNumber(2)
  WebPush_Key ensureKey() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
