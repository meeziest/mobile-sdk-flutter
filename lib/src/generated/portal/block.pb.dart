//
//  Generated code. Do not modify.
//  source: portal/block.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/rpc/status.pb.dart' as $14;
import 'lookup.pb.dart' as $15;

/// Block
class Block extends $pb.GeneratedMessage {
  factory Block({
    $14.Status? status,
    $fixnum.Int64? updatedAt,
    $15.Lookup? updatedBy,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (updatedBy != null) {
      $result.updatedBy = updatedBy;
    }
    return $result;
  }
  Block._() : super();
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Block', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$14.Status>(1, _omitFieldNames ? '' : 'status', subBuilder: $14.Status.create)
    ..aInt64(2, _omitFieldNames ? '' : 'updatedAt')
    ..aOM<$15.Lookup>(3, _omitFieldNames ? '' : 'updatedBy', subBuilder: $15.Lookup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Block clone() => Block()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block)) as Block;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block? _defaultInstance;

  /// Block reason.
  @$pb.TagNumber(1)
  $14.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($14.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  $14.Status ensureStatus() => $_ensure(0);

  /// Last update timestamp
  @$pb.TagNumber(2)
  $fixnum.Int64 get updatedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set updatedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedAt() => clearField(2);

  /// Last update performer
  @$pb.TagNumber(3)
  $15.Lookup get updatedBy => $_getN(2);
  @$pb.TagNumber(3)
  set updatedBy($15.Lookup v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdatedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedBy() => clearField(3);
  @$pb.TagNumber(3)
  $15.Lookup ensureUpdatedBy() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
