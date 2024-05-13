//
//  Generated code. Do not modify.
//  source: portal/connect.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/any.pb.dart' as $13;
import '../google/rpc/status.pb.dart' as $14;

/// Update notification message.
/// MAY be `Response` to the `Request`
/// -OR- well-known Update *like message
class Update extends $pb.GeneratedMessage {
  factory Update({
    $fixnum.Int64? date,
    $13.Any? data,
  }) {
    final $result = create();
    if (date != null) {
      $result.date = date;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  Update._() : super();
  factory Update.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Update.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Update', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'date')
    ..aOM<$13.Any>(3, _omitFieldNames ? '' : 'data', subBuilder: $13.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Update clone() => Update()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Update copyWith(void Function(Update) updates) => super.copyWith((message) => updates(message as Update)) as Update;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Update create() => Update._();
  Update createEmptyInstance() => create();
  static $pb.PbList<Update> createRepeated() => $pb.PbList<Update>();
  @$core.pragma('dart2js:noInline')
  static Update getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Update>(create);
  static Update? _defaultInstance;

  /// Date when this update was sent.
  @$pb.TagNumber(1)
  $fixnum.Int64 get date => $_getI64(0);
  @$pb.TagNumber(1)
  set date($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);

  /// Update notification message data
  @$pb.TagNumber(3)
  $13.Any get data => $_getN(1);
  @$pb.TagNumber(3)
  set data($13.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $13.Any ensureData() => $_ensure(1);
}

/// RPC Request envelope
class Request extends $pb.GeneratedMessage {
  factory Request({
    $core.String? id,
    $core.String? path,
    $13.Any? data,
    $core.Map<$core.String, $core.String>? meta,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (path != null) {
      $result.path = path;
    }
    if (data != null) {
      $result.data = data;
    }
    if (meta != null) {
      $result.meta.addAll(meta);
    }
    return $result;
  }
  Request._() : super();
  factory Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..aOM<$13.Any>(3, _omitFieldNames ? '' : 'data', subBuilder: $13.Any.create)
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'meta', entryClassName: 'Request.MetaEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('webitel.portal'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request clone() => Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request copyWith(void Function(Request) updates) => super.copyWith((message) => updates(message as Request)) as Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  /// Client generated request id ; mostly: integer sequence
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// /path/to/pkg/Service.Method
  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  /// Method *related request @type arguments
  @$pb.TagNumber(3)
  $13.Any get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($13.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $13.Any ensureData() => $_ensure(2);

  /// Metadata. Headers
  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get meta => $_getMap(3);
}

/// RPC Response to the Request
class Response extends $pb.GeneratedMessage {
  factory Response({
    $core.String? id,
    $14.Status? err,
    $13.Any? data,
    $core.Map<$core.String, $core.String>? meta,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (err != null) {
      $result.err = err;
    }
    if (data != null) {
      $result.data = data;
    }
    if (meta != null) {
      $result.meta.addAll(meta);
    }
    return $result;
  }
  Response._() : super();
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Response', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$14.Status>(2, _omitFieldNames ? '' : 'err', subBuilder: $14.Status.create)
    ..aOM<$13.Any>(3, _omitFieldNames ? '' : 'data', subBuilder: $13.Any.create)
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'meta', entryClassName: 'Response.MetaEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('webitel.portal'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  /// Client request id
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// RPC failure status
  @$pb.TagNumber(2)
  $14.Status get err => $_getN(1);
  @$pb.TagNumber(2)
  set err($14.Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasErr() => $_has(1);
  @$pb.TagNumber(2)
  void clearErr() => clearField(2);
  @$pb.TagNumber(2)
  $14.Status ensureErr() => $_ensure(1);

  /// Result payload data
  @$pb.TagNumber(3)
  $13.Any get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($13.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $13.Any ensureData() => $_ensure(2);

  /// Metadata. Headers
  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get meta => $_getMap(3);
}

class UpdateSignedOut extends $pb.GeneratedMessage {
  factory UpdateSignedOut({
    $14.Status? cause,
  }) {
    final $result = create();
    if (cause != null) {
      $result.cause = cause;
    }
    return $result;
  }
  UpdateSignedOut._() : super();
  factory UpdateSignedOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSignedOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSignedOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$14.Status>(1, _omitFieldNames ? '' : 'cause', subBuilder: $14.Status.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSignedOut clone() => UpdateSignedOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSignedOut copyWith(void Function(UpdateSignedOut) updates) => super.copyWith((message) => updates(message as UpdateSignedOut)) as UpdateSignedOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSignedOut create() => UpdateSignedOut._();
  UpdateSignedOut createEmptyInstance() => create();
  static $pb.PbList<UpdateSignedOut> createRepeated() => $pb.PbList<UpdateSignedOut>();
  @$core.pragma('dart2js:noInline')
  static UpdateSignedOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSignedOut>(create);
  static UpdateSignedOut? _defaultInstance;

  @$pb.TagNumber(1)
  $14.Status get cause => $_getN(0);
  @$pb.TagNumber(1)
  set cause($14.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCause() => $_has(0);
  @$pb.TagNumber(1)
  void clearCause() => clearField(1);
  @$pb.TagNumber(1)
  $14.Status ensureCause() => $_ensure(0);
}

class Echo extends $pb.GeneratedMessage {
  factory Echo({
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  Echo._() : super();
  factory Echo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Echo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Echo', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Echo clone() => Echo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Echo copyWith(void Function(Echo) updates) => super.copyWith((message) => updates(message as Echo)) as Echo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Echo create() => Echo._();
  Echo createEmptyInstance() => create();
  static $pb.PbList<Echo> createRepeated() => $pb.PbList<Echo>();
  @$core.pragma('dart2js:noInline')
  static Echo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Echo>(create);
  static Echo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
