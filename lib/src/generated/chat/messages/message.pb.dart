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
import 'message.pbenum.dart';
import 'peer.pb.dart' as $7;

export 'message.pbenum.dart';

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
    ReplyMarkup? keyboard,
    Postback? postback,
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
    if (keyboard != null) {
      $result.keyboard = keyboard;
    }
    if (postback != null) {
      $result.postback = postback;
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
    ..aOM<ReplyMarkup>(10, _omitFieldNames ? '' : 'keyboard', subBuilder: ReplyMarkup.create)
    ..aOM<Postback>(11, _omitFieldNames ? '' : 'postback', subBuilder: Postback.create)
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

  /// Keyboard. Buttons. Quick Replies.
  @$pb.TagNumber(10)
  ReplyMarkup get keyboard => $_getN(9);
  @$pb.TagNumber(10)
  set keyboard(ReplyMarkup v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasKeyboard() => $_has(9);
  @$pb.TagNumber(10)
  void clearKeyboard() => clearField(10);
  @$pb.TagNumber(10)
  ReplyMarkup ensureKeyboard() => $_ensure(9);

  /// Postback. Reply Button Click[ed].
  @$pb.TagNumber(11)
  Postback get postback => $_getN(10);
  @$pb.TagNumber(11)
  set postback(Postback v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasPostback() => $_has(10);
  @$pb.TagNumber(11)
  void clearPostback() => clearField(11);
  @$pb.TagNumber(11)
  Postback ensurePostback() => $_ensure(10);
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

class ReplyMarkup extends $pb.GeneratedMessage {
  factory ReplyMarkup({
    $core.Iterable<ButtonRow>? buttons,
    $core.bool? noInput,
  }) {
    final $result = create();
    if (buttons != null) {
      $result.buttons.addAll(buttons);
    }
    if (noInput != null) {
      $result.noInput = noInput;
    }
    return $result;
  }
  ReplyMarkup._() : super();
  factory ReplyMarkup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyMarkup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyMarkup', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..pc<ButtonRow>(1, _omitFieldNames ? '' : 'buttons', $pb.PbFieldType.PM, subBuilder: ButtonRow.create)
    ..aOB(2, _omitFieldNames ? '' : 'noInput')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyMarkup clone() => ReplyMarkup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyMarkup copyWith(void Function(ReplyMarkup) updates) => super.copyWith((message) => updates(message as ReplyMarkup)) as ReplyMarkup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyMarkup create() => ReplyMarkup._();
  ReplyMarkup createEmptyInstance() => create();
  static $pb.PbList<ReplyMarkup> createRepeated() => $pb.PbList<ReplyMarkup>();
  @$core.pragma('dart2js:noInline')
  static ReplyMarkup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyMarkup>(create);
  static ReplyMarkup? _defaultInstance;

  /// Markup of button(s)
  @$pb.TagNumber(1)
  $core.List<ButtonRow> get buttons => $_getList(0);

  /// An option used to block input to force
  /// the user to respond with one of the buttons.
  @$pb.TagNumber(2)
  $core.bool get noInput => $_getBF(1);
  @$pb.TagNumber(2)
  set noInput($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNoInput() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoInput() => clearField(2);
}

class ButtonRow extends $pb.GeneratedMessage {
  factory ButtonRow({
    $core.Iterable<Button>? row,
  }) {
    final $result = create();
    if (row != null) {
      $result.row.addAll(row);
    }
    return $result;
  }
  ButtonRow._() : super();
  factory ButtonRow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ButtonRow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ButtonRow', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..pc<Button>(1, _omitFieldNames ? '' : 'row', $pb.PbFieldType.PM, subBuilder: Button.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ButtonRow clone() => ButtonRow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ButtonRow copyWith(void Function(ButtonRow) updates) => super.copyWith((message) => updates(message as ButtonRow)) as ButtonRow;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ButtonRow create() => ButtonRow._();
  ButtonRow createEmptyInstance() => create();
  static $pb.PbList<ButtonRow> createRepeated() => $pb.PbList<ButtonRow>();
  @$core.pragma('dart2js:noInline')
  static ButtonRow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ButtonRow>(create);
  static ButtonRow? _defaultInstance;

  /// Button(s) in a row
  @$pb.TagNumber(1)
  $core.List<Button> get row => $_getList(0);
}

enum Button_Type {
  url, 
  code, 
  share, 
  notSet
}

class Button extends $pb.GeneratedMessage {
  factory Button({
    $core.String? text,
    $core.String? url,
    $core.String? code,
    Button_Request? share,
  }) {
    final $result = create();
    if (text != null) {
      $result.text = text;
    }
    if (url != null) {
      $result.url = url;
    }
    if (code != null) {
      $result.code = code;
    }
    if (share != null) {
      $result.share = share;
    }
    return $result;
  }
  Button._() : super();
  factory Button.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Button.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Button_Type> _Button_TypeByTag = {
    2 : Button_Type.url,
    3 : Button_Type.code,
    4 : Button_Type.share,
    0 : Button_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Button', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'code')
    ..e<Button_Request>(4, _omitFieldNames ? '' : 'share', $pb.PbFieldType.OE, defaultOrMaker: Button_Request.phone, valueOf: Button_Request.valueOf, enumValues: Button_Request.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Button clone() => Button()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Button copyWith(void Function(Button) updates) => super.copyWith((message) => updates(message as Button)) as Button;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Button create() => Button._();
  Button createEmptyInstance() => create();
  static $pb.PbList<Button> createRepeated() => $pb.PbList<Button>();
  @$core.pragma('dart2js:noInline')
  static Button getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Button>(create);
  static Button? _defaultInstance;

  Button_Type whichType() => _Button_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  /// Caption to display.
  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  /// URL to navigate to ..
  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  /// Postback/Callback data.
  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  /// Request to share contact info.
  @$pb.TagNumber(4)
  Button_Request get share => $_getN(3);
  @$pb.TagNumber(4)
  set share(Button_Request v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasShare() => $_has(3);
  @$pb.TagNumber(4)
  void clearShare() => clearField(4);
}

/// Postback. Reply Button Click[ed].
class Postback extends $pb.GeneratedMessage {
  factory Postback({
    $fixnum.Int64? mid,
    $core.String? code,
    $core.String? text,
  }) {
    final $result = create();
    if (mid != null) {
      $result.mid = mid;
    }
    if (code != null) {
      $result.code = code;
    }
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  Postback._() : super();
  factory Postback.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Postback.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Postback', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'mid')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Postback clone() => Postback()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Postback copyWith(void Function(Postback) updates) => super.copyWith((message) => updates(message as Postback)) as Postback;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Postback create() => Postback._();
  Postback createEmptyInstance() => create();
  static $pb.PbList<Postback> createRepeated() => $pb.PbList<Postback>();
  @$core.pragma('dart2js:noInline')
  static Postback getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Postback>(create);
  static Postback? _defaultInstance;

  /// Message ID of the button.
  @$pb.TagNumber(1)
  $fixnum.Int64 get mid => $_getI64(0);
  @$pb.TagNumber(1)
  set mid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMid() => clearField(1);

  /// Data associated with the Button.
  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  /// Button's display caption.
  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
