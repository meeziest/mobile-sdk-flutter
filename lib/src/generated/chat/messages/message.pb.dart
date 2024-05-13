//
//  Generated code. Do not modify.
//  source: chat/messages/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $9;
import 'peer.pb.dart' as $7;

/// Chat Message.
class Message extends $pb.GeneratedMessage {
  factory Message({
    $fixnum.Int64? id,
    $fixnum.Int64? date,
    $7.Peer? from,
    $9.Chat? chat,
    $9.Chat? sender,
    $fixnum.Int64? edit,
    $core.String? text,
    File? file,
    $core.Map<$core.String, $core.String>? context,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (date != null) {
      $result.date = date;
    }
    if (from != null) {
      $result.from = from;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    if (sender != null) {
      $result.sender = sender;
    }
    if (edit != null) {
      $result.edit = edit;
    }
    if (text != null) {
      $result.text = text;
    }
    if (file != null) {
      $result.file = file;
    }
    if (context != null) {
      $result.context.addAll(context);
    }
    return $result;
  }
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'date')
    ..aOM<$7.Peer>(3, _omitFieldNames ? '' : 'from', subBuilder: $7.Peer.create)
    ..aOM<$9.Chat>(4, _omitFieldNames ? '' : 'chat', subBuilder: $9.Chat.create)
    ..aOM<$9.Chat>(5, _omitFieldNames ? '' : 'sender', subBuilder: $9.Chat.create)
    ..aInt64(6, _omitFieldNames ? '' : 'edit')
    ..aOS(7, _omitFieldNames ? '' : 'text')
    ..aOM<File>(8, _omitFieldNames ? '' : 'file', subBuilder: File.create)
    ..m<$core.String, $core.String>(9, _omitFieldNames ? '' : 'context', entryClassName: 'Message.ContextEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('webitel.chat'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  /// Unique message identifier inside this chat.
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Timestamp when this message was sent (published).
  @$pb.TagNumber(2)
  $fixnum.Int64 get date => $_getI64(1);
  @$pb.TagNumber(2)
  set date($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => clearField(2);

  /// Sender of the message.
  @$pb.TagNumber(3)
  $7.Peer get from => $_getN(2);
  @$pb.TagNumber(3)
  set from($7.Peer v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);
  @$pb.TagNumber(3)
  $7.Peer ensureFrom() => $_ensure(2);

  /// Conversation the message belongs to ..
  @$pb.TagNumber(4)
  $9.Chat get chat => $_getN(3);
  @$pb.TagNumber(4)
  set chat($9.Chat v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasChat() => $_has(3);
  @$pb.TagNumber(4)
  void clearChat() => clearField(4);
  @$pb.TagNumber(4)
  $9.Chat ensureChat() => $_ensure(3);

  /// Chat Sender of the message, sent on behalf of a chat (member).
  @$pb.TagNumber(5)
  $9.Chat get sender => $_getN(4);
  @$pb.TagNumber(5)
  set sender($9.Chat v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSender() => $_has(4);
  @$pb.TagNumber(5)
  void clearSender() => clearField(5);
  @$pb.TagNumber(5)
  $9.Chat ensureSender() => $_ensure(4);

  /// Timestamp when this message was last edited.
  @$pb.TagNumber(6)
  $fixnum.Int64 get edit => $_getI64(5);
  @$pb.TagNumber(6)
  set edit($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEdit() => $_has(5);
  @$pb.TagNumber(6)
  void clearEdit() => clearField(6);

  /// Message Text.
  @$pb.TagNumber(7)
  $core.String get text => $_getSZ(6);
  @$pb.TagNumber(7)
  set text($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasText() => $_has(6);
  @$pb.TagNumber(7)
  void clearText() => clearField(7);

  /// Message Media. Attachment.
  @$pb.TagNumber(8)
  File get file => $_getN(7);
  @$pb.TagNumber(8)
  set file(File v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasFile() => $_has(7);
  @$pb.TagNumber(8)
  void clearFile() => clearField(8);
  @$pb.TagNumber(8)
  File ensureFile() => $_ensure(7);

  /// Context. Variables. Environment.
  @$pb.TagNumber(9)
  $core.Map<$core.String, $core.String> get context => $_getMap(8);
}

/// Media File.
class File extends $pb.GeneratedMessage {
  factory File({
    $core.String? id,
    $fixnum.Int64? size,
    $core.String? type,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (size != null) {
      $result.size = size;
    }
    if (type != null) {
      $result.type = type;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  File._() : super();
  factory File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'File', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  File copyWith(void Function(File) updates) => super.copyWith((message) => updates(message as File)) as File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  /// File location
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Size in bytes
  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  /// MIME media type
  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  /// Filename
  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
