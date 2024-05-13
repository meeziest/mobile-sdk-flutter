//
//  Generated code. Do not modify.
//  source: portal/messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../chat/messages/chat.pb.dart' as $9;
import '../chat/messages/message.pb.dart' as $6;
import '../chat/messages/peer.pb.dart' as $7;
import '../google/protobuf/wrappers.pb.dart' as $8;
import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

/// Customer end-User messaging account settings
class ChatAccount extends $pb.GeneratedMessage {
  factory ChatAccount({
    $7.Peer? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  ChatAccount._() : super();
  factory ChatAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatAccount', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$7.Peer>(1, _omitFieldNames ? '' : 'user', subBuilder: $7.Peer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatAccount clone() => ChatAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatAccount copyWith(void Function(ChatAccount) updates) => super.copyWith((message) => updates(message as ChatAccount)) as ChatAccount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatAccount create() => ChatAccount._();
  ChatAccount createEmptyInstance() => create();
  static $pb.PbList<ChatAccount> createRepeated() => $pb.PbList<ChatAccount>();
  @$core.pragma('dart2js:noInline')
  static ChatAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatAccount>(create);
  static ChatAccount? _defaultInstance;

  /// User self. The sender. You.
  @$pb.TagNumber(1)
  $7.Peer get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($7.Peer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $7.Peer ensureUser() => $_ensure(0);
}

/// Chat info.
/// Reflects chat/messages.Chat
class Chat extends $pb.GeneratedMessage {
  factory Chat({
    $core.int? inbox,
    $core.String? id,
    $7.Peer? peer,
    $fixnum.Int64? date,
    $core.String? title,
    $fixnum.Int64? left,
    $fixnum.Int64? join,
    $6.Message? message,
  }) {
    final $result = create();
    if (inbox != null) {
      $result.inbox = inbox;
    }
    if (id != null) {
      $result.id = id;
    }
    if (peer != null) {
      $result.peer = peer;
    }
    if (date != null) {
      $result.date = date;
    }
    if (title != null) {
      $result.title = title;
    }
    if (left != null) {
      $result.left = left;
    }
    if (join != null) {
      $result.join = join;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  Chat._() : super();
  factory Chat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Chat', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'inbox', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'id')
    ..aOM<$7.Peer>(4, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..aInt64(6, _omitFieldNames ? '' : 'date')
    ..aOS(7, _omitFieldNames ? '' : 'title')
    ..aInt64(8, _omitFieldNames ? '' : 'left')
    ..aInt64(9, _omitFieldNames ? '' : 'join')
    ..aOM<$6.Message>(10, _omitFieldNames ? '' : 'message', subBuilder: $6.Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chat clone() => Chat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chat copyWith(void Function(Chat) updates) => super.copyWith((message) => updates(message as Chat)) as Chat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chat create() => Chat._();
  Chat createEmptyInstance() => create();
  static $pb.PbList<Chat> createRepeated() => $pb.PbList<Chat>();
  @$core.pragma('dart2js:noInline')
  static Chat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chat>(create);
  static Chat? _defaultInstance;

  /// Inbox NEW [unread] message(s) count.
  /// ( chat.message.id ~ read.message.id )
  @$pb.TagNumber(1)
  $core.int get inbox => $_getIZ(0);
  @$pb.TagNumber(1)
  set inbox($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInbox() => $_has(0);
  @$pb.TagNumber(1)
  void clearInbox() => clearField(1);

  /// ID of the chat.
  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  /// The Interlocutor. Other side.
  @$pb.TagNumber(4)
  $7.Peer get peer => $_getN(2);
  @$pb.TagNumber(4)
  set peer($7.Peer v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPeer() => $_has(2);
  @$pb.TagNumber(4)
  void clearPeer() => clearField(4);
  @$pb.TagNumber(4)
  $7.Peer ensurePeer() => $_ensure(2);

  /// Timestamp of the last activity in the chat.
  @$pb.TagNumber(6)
  $fixnum.Int64 get date => $_getI64(3);
  @$pb.TagNumber(6)
  set date($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(6)
  void clearDate() => clearField(6);

  /// Title of the chat.
  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(7)
  set title($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  /// OPTIONAL. A non-zero value indicates that
  /// the participant has left the chat. CLOSED(!)
  @$pb.TagNumber(8)
  $fixnum.Int64 get left => $_getI64(5);
  @$pb.TagNumber(8)
  set left($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasLeft() => $_has(5);
  @$pb.TagNumber(8)
  void clearLeft() => clearField(8);

  /// OPTIONAL. A non-zero value indicates when
  /// the participant joined this chat conversation.
  @$pb.TagNumber(9)
  $fixnum.Int64 get join => $_getI64(6);
  @$pb.TagNumber(9)
  set join($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasJoin() => $_has(6);
  @$pb.TagNumber(9)
  void clearJoin() => clearField(9);

  /// Top (last) message in this chat.
  @$pb.TagNumber(10)
  $6.Message get message => $_getN(7);
  @$pb.TagNumber(10)
  set message($6.Message v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMessage() => $_has(7);
  @$pb.TagNumber(10)
  void clearMessage() => clearField(10);
  @$pb.TagNumber(10)
  $6.Message ensureMessage() => $_ensure(7);
}

class ChatDialogsRequest extends $pb.GeneratedMessage {
  factory ChatDialogsRequest({
    $core.int? page,
    $core.int? size,
    $core.Iterable<$core.String>? sort,
    $core.Iterable<$core.String>? fields,
    $core.String? q,
    $core.Iterable<$core.String>? id,
    $7.Peer? peer,
    $9.Timerange? date,
    $8.BoolValue? online,
  }) {
    final $result = create();
    if (page != null) {
      $result.page = page;
    }
    if (size != null) {
      $result.size = size;
    }
    if (sort != null) {
      $result.sort.addAll(sort);
    }
    if (fields != null) {
      $result.fields.addAll(fields);
    }
    if (q != null) {
      $result.q = q;
    }
    if (id != null) {
      $result.id.addAll(id);
    }
    if (peer != null) {
      $result.peer = peer;
    }
    if (date != null) {
      $result.date = date;
    }
    if (online != null) {
      $result.online = online;
    }
    return $result;
  }
  ChatDialogsRequest._() : super();
  factory ChatDialogsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatDialogsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatDialogsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'size', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'sort')
    ..pPS(4, _omitFieldNames ? '' : 'fields')
    ..aOS(5, _omitFieldNames ? '' : 'q')
    ..pPS(6, _omitFieldNames ? '' : 'id')
    ..aOM<$7.Peer>(8, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..aOM<$9.Timerange>(9, _omitFieldNames ? '' : 'date', subBuilder: $9.Timerange.create)
    ..aOM<$8.BoolValue>(10, _omitFieldNames ? '' : 'online', subBuilder: $8.BoolValue.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatDialogsRequest clone() => ChatDialogsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatDialogsRequest copyWith(void Function(ChatDialogsRequest) updates) => super.copyWith((message) => updates(message as ChatDialogsRequest)) as ChatDialogsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatDialogsRequest create() => ChatDialogsRequest._();
  ChatDialogsRequest createEmptyInstance() => create();
  static $pb.PbList<ChatDialogsRequest> createRepeated() => $pb.PbList<ChatDialogsRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatDialogsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatDialogsRequest>(create);
  static ChatDialogsRequest? _defaultInstance;

  /// Page number to return. **default**: 1.
  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  /// Page records limit. **default**: 16.
  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  /// Sort records by { fields } specification.
  @$pb.TagNumber(3)
  $core.List<$core.String> get sort => $_getList(2);

  /// Fields [Q]uery to build result dataset record.
  @$pb.TagNumber(4)
  $core.List<$core.String> get fields => $_getList(3);

  /// Search term: peer.name
  @$pb.TagNumber(5)
  $core.String get q => $_getSZ(4);
  @$pb.TagNumber(5)
  set q($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQ() => $_has(4);
  @$pb.TagNumber(5)
  void clearQ() => clearField(5);

  /// Set of unique chat IDentifier(s).
  /// Accept: dialog -or- member ID.
  @$pb.TagNumber(6)
  $core.List<$core.String> get id => $_getList(5);

  /// [PEER] Member of ...
  @$pb.TagNumber(8)
  $7.Peer get peer => $_getN(6);
  @$pb.TagNumber(8)
  set peer($7.Peer v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPeer() => $_has(6);
  @$pb.TagNumber(8)
  void clearPeer() => clearField(8);
  @$pb.TagNumber(8)
  $7.Peer ensurePeer() => $_ensure(6);

  /// Date within timerange.
  @$pb.TagNumber(9)
  $9.Timerange get date => $_getN(7);
  @$pb.TagNumber(9)
  set date($9.Timerange v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDate() => $_has(7);
  @$pb.TagNumber(9)
  void clearDate() => clearField(9);
  @$pb.TagNumber(9)
  $9.Timerange ensureDate() => $_ensure(7);

  /// Dialogs ONLY that are currently [not] active( closed: ? ).
  @$pb.TagNumber(10)
  $8.BoolValue get online => $_getN(8);
  @$pb.TagNumber(10)
  set online($8.BoolValue v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasOnline() => $_has(8);
  @$pb.TagNumber(10)
  void clearOnline() => clearField(10);
  @$pb.TagNumber(10)
  $8.BoolValue ensureOnline() => $_ensure(8);
}

/// ChatDialogs dataset
class ChatList extends $pb.GeneratedMessage {
  factory ChatList({
    $core.Iterable<Chat>? data,
    $core.int? page,
    $core.bool? next,
  }) {
    final $result = create();
    if (data != null) {
      $result.data.addAll(data);
    }
    if (page != null) {
      $result.page = page;
    }
    if (next != null) {
      $result.next = next;
    }
    return $result;
  }
  ChatList._() : super();
  factory ChatList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatList', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..pc<Chat>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PM, subBuilder: Chat.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..aOB(3, _omitFieldNames ? '' : 'next')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatList clone() => ChatList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatList copyWith(void Function(ChatList) updates) => super.copyWith((message) => updates(message as ChatList)) as ChatList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatList create() => ChatList._();
  ChatList createEmptyInstance() => create();
  static $pb.PbList<ChatList> createRepeated() => $pb.PbList<ChatList>();
  @$core.pragma('dart2js:noInline')
  static ChatList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatList>(create);
  static ChatList? _defaultInstance;

  /// Dataset page of Chat(s).
  @$pb.TagNumber(1)
  $core.List<Chat> get data => $_getList(0);

  /// Page number of results.
  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  /// Next page available ?
  @$pb.TagNumber(3)
  $core.bool get next => $_getBF(2);
  @$pb.TagNumber(3)
  set next($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNext() => $_has(2);
  @$pb.TagNumber(3)
  void clearNext() => clearField(3);
}

class SendMessageRequest extends $pb.GeneratedMessage {
  factory SendMessageRequest({
    $7.Peer? peer,
    $6.File? file,
    $core.String? text,
    $core.String? id,
  }) {
    final $result = create();
    if (peer != null) {
      $result.peer = peer;
    }
    if (file != null) {
      $result.file = file;
    }
    if (text != null) {
      $result.text = text;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  SendMessageRequest._() : super();
  factory SendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$7.Peer>(1, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..aOM<$6.File>(2, _omitFieldNames ? '' : 'file', subBuilder: $6.File.create)
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageRequest clone() => SendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageRequest copyWith(void Function(SendMessageRequest) updates) => super.copyWith((message) => updates(message as SendMessageRequest)) as SendMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMessageRequest create() => SendMessageRequest._();
  SendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<SendMessageRequest> createRepeated() => $pb.PbList<SendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static SendMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageRequest>(create);
  static SendMessageRequest? _defaultInstance;

  /// The destination where the message will be sent.
  /// - peer{ type:"chat", id: $chat_id }
  /// - peer{ type:"user", id: $user_id }
  /// Missing peer - points TO the default
  /// portal "Service" (bot) chat dialog.
  @$pb.TagNumber(1)
  $7.Peer get peer => $_getN(0);
  @$pb.TagNumber(1)
  set peer($7.Peer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeer() => clearField(1);
  @$pb.TagNumber(1)
  $7.Peer ensurePeer() => $_ensure(0);

  /// Media file uploaded.
  /// Not implemented yet.
  @$pb.TagNumber(2)
  $6.File get file => $_getN(1);
  @$pb.TagNumber(2)
  set file($6.File v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFile() => $_has(1);
  @$pb.TagNumber(2)
  void clearFile() => clearField(2);
  @$pb.TagNumber(2)
  $6.File ensureFile() => $_ensure(1);

  /// Media text message.
  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);

  /// Client associated message id.
  /// DEFAULT: Connect.Request.id
  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);
}

class ReadHistoryRequest extends $pb.GeneratedMessage {
  factory ReadHistoryRequest({
    $7.Peer? peer,
    $fixnum.Int64? maxId,
  }) {
    final $result = create();
    if (peer != null) {
      $result.peer = peer;
    }
    if (maxId != null) {
      $result.maxId = maxId;
    }
    return $result;
  }
  ReadHistoryRequest._() : super();
  factory ReadHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$7.Peer>(1, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..aInt64(2, _omitFieldNames ? '' : 'maxId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadHistoryRequest clone() => ReadHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadHistoryRequest copyWith(void Function(ReadHistoryRequest) updates) => super.copyWith((message) => updates(message as ReadHistoryRequest)) as ReadHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadHistoryRequest create() => ReadHistoryRequest._();
  ReadHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<ReadHistoryRequest> createRepeated() => $pb.PbList<ReadHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadHistoryRequest>(create);
  static ReadHistoryRequest? _defaultInstance;

  /// Target chat dialog or user.
  /// - peer{ type:"chat", id: $chat_id }
  /// - peer{ type:"user", id: $user_id }
  /// Missing peer - points TO the default
  /// portal service chat Bot dialog.
  @$pb.TagNumber(1)
  $7.Peer get peer => $_getN(0);
  @$pb.TagNumber(1)
  set peer($7.Peer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeer() => clearField(1);
  @$pb.TagNumber(1)
  $7.Peer ensurePeer() => $_ensure(0);

  /// If a positive value is passed,
  /// only messages with identifiers
  /// less or equal than the given one
  /// will be read.
  @$pb.TagNumber(2)
  $fixnum.Int64 get maxId => $_getI64(1);
  @$pb.TagNumber(2)
  set maxId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxId() => clearField(2);
}

/// New message in a chat history.
class UpdateNewMessage extends $pb.GeneratedMessage {
  factory UpdateNewMessage({
    Disposition? dispo,
    $6.Message? message,
    $core.String? id,
  }) {
    final $result = create();
    if (dispo != null) {
      $result.dispo = dispo;
    }
    if (message != null) {
      $result.message = message;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  UpdateNewMessage._() : super();
  factory UpdateNewMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNewMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNewMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..e<Disposition>(1, _omitFieldNames ? '' : 'dispo', $pb.PbFieldType.OE, defaultOrMaker: Disposition.Outgoing, valueOf: Disposition.valueOf, enumValues: Disposition.values)
    ..aOM<$6.Message>(2, _omitFieldNames ? '' : 'message', subBuilder: $6.Message.create)
    ..aOS(3, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNewMessage clone() => UpdateNewMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNewMessage copyWith(void Function(UpdateNewMessage) updates) => super.copyWith((message) => updates(message as UpdateNewMessage)) as UpdateNewMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNewMessage create() => UpdateNewMessage._();
  UpdateNewMessage createEmptyInstance() => create();
  static $pb.PbList<UpdateNewMessage> createRepeated() => $pb.PbList<UpdateNewMessage>();
  @$core.pragma('dart2js:noInline')
  static UpdateNewMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNewMessage>(create);
  static UpdateNewMessage? _defaultInstance;

  /// Disposition of the current user.
  @$pb.TagNumber(1)
  Disposition get dispo => $_getN(0);
  @$pb.TagNumber(1)
  set dispo(Disposition v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDispo() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispo() => clearField(1);

  /// NEW message details.
  @$pb.TagNumber(2)
  $6.Message get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($6.Message v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
  @$pb.TagNumber(2)
  $6.Message ensureMessage() => $_ensure(1);

  /// OPTIONAL. Client [send] message id.
  /// DEFAULT: Connect.Request.id
  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

/// Update about join NEW member(s) to the chat.
class UpdateChatMember extends $pb.GeneratedMessage {
  factory UpdateChatMember({
    $9.Chat? chat,
    $core.Iterable<$7.Peer>? join,
  }) {
    final $result = create();
    if (chat != null) {
      $result.chat = chat;
    }
    if (join != null) {
      $result.join.addAll(join);
    }
    return $result;
  }
  UpdateChatMember._() : super();
  factory UpdateChatMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatMember', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$9.Chat>(1, _omitFieldNames ? '' : 'chat', subBuilder: $9.Chat.create)
    ..pc<$7.Peer>(2, _omitFieldNames ? '' : 'join', $pb.PbFieldType.PM, subBuilder: $7.Peer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatMember clone() => UpdateChatMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatMember copyWith(void Function(UpdateChatMember) updates) => super.copyWith((message) => updates(message as UpdateChatMember)) as UpdateChatMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatMember create() => UpdateChatMember._();
  UpdateChatMember createEmptyInstance() => create();
  static $pb.PbList<UpdateChatMember> createRepeated() => $pb.PbList<UpdateChatMember>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatMember>(create);
  static UpdateChatMember? _defaultInstance;

  /// Chat [TO] Update.
  @$pb.TagNumber(1)
  $9.Chat get chat => $_getN(0);
  @$pb.TagNumber(1)
  set chat($9.Chat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearChat() => clearField(1);
  @$pb.TagNumber(1)
  $9.Chat ensureChat() => $_ensure(0);

  /// Join NEW member(s)..
  @$pb.TagNumber(2)
  $core.List<$7.Peer> get join => $_getList(1);
}

/// Update about that the member left the chat.
class UpdateLeftMember extends $pb.GeneratedMessage {
  factory UpdateLeftMember({
    $9.Chat? chat,
    $7.Peer? left,
  }) {
    final $result = create();
    if (chat != null) {
      $result.chat = chat;
    }
    if (left != null) {
      $result.left = left;
    }
    return $result;
  }
  UpdateLeftMember._() : super();
  factory UpdateLeftMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLeftMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLeftMember', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$9.Chat>(1, _omitFieldNames ? '' : 'chat', subBuilder: $9.Chat.create)
    ..aOM<$7.Peer>(2, _omitFieldNames ? '' : 'left', subBuilder: $7.Peer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLeftMember clone() => UpdateLeftMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLeftMember copyWith(void Function(UpdateLeftMember) updates) => super.copyWith((message) => updates(message as UpdateLeftMember)) as UpdateLeftMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLeftMember create() => UpdateLeftMember._();
  UpdateLeftMember createEmptyInstance() => create();
  static $pb.PbList<UpdateLeftMember> createRepeated() => $pb.PbList<UpdateLeftMember>();
  @$core.pragma('dart2js:noInline')
  static UpdateLeftMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLeftMember>(create);
  static UpdateLeftMember? _defaultInstance;

  /// Chat [TO] Update.
  @$pb.TagNumber(1)
  $9.Chat get chat => $_getN(0);
  @$pb.TagNumber(1)
  set chat($9.Chat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearChat() => clearField(1);
  @$pb.TagNumber(1)
  $9.Chat ensureChat() => $_ensure(0);

  /// The member who left the chat.
  @$pb.TagNumber(2)
  $7.Peer get left => $_getN(1);
  @$pb.TagNumber(2)
  set left($7.Peer v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeft() => clearField(2);
  @$pb.TagNumber(2)
  $7.Peer ensureLeft() => $_ensure(1);
}

/// Update about that the chat dialog is complete.
/// NOTE: Next Messages.SendMessage call will open NEW dialog.chat
class UpdateChatComplete extends $pb.GeneratedMessage {
  factory UpdateChatComplete({
    $9.Chat? chat,
    $7.Peer? from,
  }) {
    final $result = create();
    if (chat != null) {
      $result.chat = chat;
    }
    if (from != null) {
      $result.from = from;
    }
    return $result;
  }
  UpdateChatComplete._() : super();
  factory UpdateChatComplete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatComplete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatComplete', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$9.Chat>(1, _omitFieldNames ? '' : 'chat', subBuilder: $9.Chat.create)
    ..aOM<$7.Peer>(2, _omitFieldNames ? '' : 'from', subBuilder: $7.Peer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatComplete clone() => UpdateChatComplete()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatComplete copyWith(void Function(UpdateChatComplete) updates) => super.copyWith((message) => updates(message as UpdateChatComplete)) as UpdateChatComplete;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatComplete create() => UpdateChatComplete._();
  UpdateChatComplete createEmptyInstance() => create();
  static $pb.PbList<UpdateChatComplete> createRepeated() => $pb.PbList<UpdateChatComplete>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatComplete getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatComplete>(create);
  static UpdateChatComplete? _defaultInstance;

  /// Chat [TO] Update.
  @$pb.TagNumber(1)
  $9.Chat get chat => $_getN(0);
  @$pb.TagNumber(1)
  set chat($9.Chat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearChat() => clearField(1);
  @$pb.TagNumber(1)
  $9.Chat ensureChat() => $_ensure(0);

  /// Side member who closed this chat dialog.
  @$pb.TagNumber(2)
  $7.Peer get from => $_getN(1);
  @$pb.TagNumber(2)
  set from($7.Peer v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  $7.Peer ensureFrom() => $_ensure(1);
}

/// Incoming messages were read
class UpdateReadHistoryInbox extends $pb.GeneratedMessage {
  factory UpdateReadHistoryInbox({
    $7.Peer? peer,
    $fixnum.Int64? maxId,
    $core.int? inbox,
  }) {
    final $result = create();
    if (peer != null) {
      $result.peer = peer;
    }
    if (maxId != null) {
      $result.maxId = maxId;
    }
    if (inbox != null) {
      $result.inbox = inbox;
    }
    return $result;
  }
  UpdateReadHistoryInbox._() : super();
  factory UpdateReadHistoryInbox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateReadHistoryInbox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateReadHistoryInbox', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$7.Peer>(1, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..aInt64(2, _omitFieldNames ? '' : 'maxId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'inbox', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateReadHistoryInbox clone() => UpdateReadHistoryInbox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateReadHistoryInbox copyWith(void Function(UpdateReadHistoryInbox) updates) => super.copyWith((message) => updates(message as UpdateReadHistoryInbox)) as UpdateReadHistoryInbox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateReadHistoryInbox create() => UpdateReadHistoryInbox._();
  UpdateReadHistoryInbox createEmptyInstance() => create();
  static $pb.PbList<UpdateReadHistoryInbox> createRepeated() => $pb.PbList<UpdateReadHistoryInbox>();
  @$core.pragma('dart2js:noInline')
  static UpdateReadHistoryInbox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateReadHistoryInbox>(create);
  static UpdateReadHistoryInbox? _defaultInstance;

  /// Peer chat dialog
  @$pb.TagNumber(1)
  $7.Peer get peer => $_getN(0);
  @$pb.TagNumber(1)
  set peer($7.Peer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeer() => clearField(1);
  @$pb.TagNumber(1)
  $7.Peer ensurePeer() => $_ensure(0);

  /// Maximum ID of messages read
  @$pb.TagNumber(2)
  $fixnum.Int64 get maxId => $_getI64(1);
  @$pb.TagNumber(2)
  set maxId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxId() => clearField(2);

  /// Number of messages that are still unread
  @$pb.TagNumber(3)
  $core.int get inbox => $_getIZ(2);
  @$pb.TagNumber(3)
  set inbox($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInbox() => $_has(2);
  @$pb.TagNumber(3)
  void clearInbox() => clearField(3);
}

/// Outgoing messages were read
/// Not Implemented yet !
class UpdateReadHistoryOutbox extends $pb.GeneratedMessage {
  factory UpdateReadHistoryOutbox({
    $7.Peer? peer,
    $fixnum.Int64? maxId,
  }) {
    final $result = create();
    if (peer != null) {
      $result.peer = peer;
    }
    if (maxId != null) {
      $result.maxId = maxId;
    }
    return $result;
  }
  UpdateReadHistoryOutbox._() : super();
  factory UpdateReadHistoryOutbox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateReadHistoryOutbox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateReadHistoryOutbox', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$7.Peer>(1, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..aInt64(2, _omitFieldNames ? '' : 'maxId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateReadHistoryOutbox clone() => UpdateReadHistoryOutbox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateReadHistoryOutbox copyWith(void Function(UpdateReadHistoryOutbox) updates) => super.copyWith((message) => updates(message as UpdateReadHistoryOutbox)) as UpdateReadHistoryOutbox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateReadHistoryOutbox create() => UpdateReadHistoryOutbox._();
  UpdateReadHistoryOutbox createEmptyInstance() => create();
  static $pb.PbList<UpdateReadHistoryOutbox> createRepeated() => $pb.PbList<UpdateReadHistoryOutbox>();
  @$core.pragma('dart2js:noInline')
  static UpdateReadHistoryOutbox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateReadHistoryOutbox>(create);
  static UpdateReadHistoryOutbox? _defaultInstance;

  /// Peer chat dialog
  @$pb.TagNumber(1)
  $7.Peer get peer => $_getN(0);
  @$pb.TagNumber(1)
  set peer($7.Peer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeer() => clearField(1);
  @$pb.TagNumber(1)
  $7.Peer ensurePeer() => $_ensure(0);

  /// Maximum ID of read outgoing messages
  @$pb.TagNumber(2)
  $fixnum.Int64 get maxId => $_getI64(1);
  @$pb.TagNumber(2)
  set maxId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxId() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
