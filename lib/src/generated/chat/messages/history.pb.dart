//
//  Generated code. Do not modify.
//  source: chat/messages/history.proto
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
import 'message.pb.dart' as $6;
import 'peer.pb.dart' as $7;

/// ChatMessages dataset
class ChatMessages extends $pb.GeneratedMessage {
  factory ChatMessages({
    $core.Iterable<$6.Message>? messages,
    $core.Iterable<$9.Chat>? chats,
    $core.Iterable<$7.Peer>? peers,
    $core.int? page,
    $core.bool? next,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (chats != null) {
      $result.chats.addAll(chats);
    }
    if (peers != null) {
      $result.peers.addAll(peers);
    }
    if (page != null) {
      $result.page = page;
    }
    if (next != null) {
      $result.next = next;
    }
    return $result;
  }
  ChatMessages._() : super();
  factory ChatMessages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessages', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..pc<$6.Message>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: $6.Message.create)
    ..pc<$9.Chat>(2, _omitFieldNames ? '' : 'chats', $pb.PbFieldType.PM, subBuilder: $9.Chat.create)
    ..pc<$7.Peer>(3, _omitFieldNames ? '' : 'peers', $pb.PbFieldType.PM, subBuilder: $7.Peer.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..aOB(6, _omitFieldNames ? '' : 'next')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessages clone() => ChatMessages()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessages copyWith(void Function(ChatMessages) updates) => super.copyWith((message) => updates(message as ChatMessages)) as ChatMessages;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessages create() => ChatMessages._();
  ChatMessages createEmptyInstance() => create();
  static $pb.PbList<ChatMessages> createRepeated() => $pb.PbList<ChatMessages>();
  @$core.pragma('dart2js:noInline')
  static ChatMessages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessages>(create);
  static ChatMessages? _defaultInstance;

  /// Dataset page of messages.
  @$pb.TagNumber(1)
  $core.List<$6.Message> get messages => $_getList(0);

  /// List of chats mentioned in messages. [FROM]
  @$pb.TagNumber(2)
  $core.List<$9.Chat> get chats => $_getList(1);

  /// List of peers mentioned in messages. [FROM]
  @$pb.TagNumber(3)
  $core.List<$7.Peer> get peers => $_getList(2);

  /// Dataset page number.
  @$pb.TagNumber(5)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(5)
  set page($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(5)
  void clearPage() => clearField(5);

  /// Next page is available ?
  @$pb.TagNumber(6)
  $core.bool get next => $_getBF(4);
  @$pb.TagNumber(6)
  set next($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasNext() => $_has(4);
  @$pb.TagNumber(6)
  void clearNext() => clearField(6);
}

/// Offset options
class ChatMessagesRequest_Offset extends $pb.GeneratedMessage {
  factory ChatMessagesRequest_Offset({
    $fixnum.Int64? id,
    $fixnum.Int64? date,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (date != null) {
      $result.date = date;
    }
    return $result;
  }
  ChatMessagesRequest_Offset._() : super();
  factory ChatMessagesRequest_Offset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessagesRequest_Offset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessagesRequest.Offset', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'date')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessagesRequest_Offset clone() => ChatMessagesRequest_Offset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessagesRequest_Offset copyWith(void Function(ChatMessagesRequest_Offset) updates) => super.copyWith((message) => updates(message as ChatMessagesRequest_Offset)) as ChatMessagesRequest_Offset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessagesRequest_Offset create() => ChatMessagesRequest_Offset._();
  ChatMessagesRequest_Offset createEmptyInstance() => create();
  static $pb.PbList<ChatMessagesRequest_Offset> createRepeated() => $pb.PbList<ChatMessagesRequest_Offset>();
  @$core.pragma('dart2js:noInline')
  static ChatMessagesRequest_Offset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessagesRequest_Offset>(create);
  static ChatMessagesRequest_Offset? _defaultInstance;

  /// Messages ONLY starting from the specified message ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// Messages ONLY been sent before the specified epochtime(milli).
  @$pb.TagNumber(2)
  $fixnum.Int64 get date => $_getI64(1);
  @$pb.TagNumber(2)
  set date($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => clearField(2);
}

enum ChatMessagesRequest_Chat {
  chatId, 
  peer, 
  notSet
}

class ChatMessagesRequest extends $pb.GeneratedMessage {
  factory ChatMessagesRequest({
    ChatMessagesRequest_Offset? offset,
    $core.int? limit,
    $core.Iterable<$core.String>? fields,
    $core.String? q,
    $core.String? chatId,
    $7.Peer? peer,
  }) {
    final $result = create();
    if (offset != null) {
      $result.offset = offset;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (fields != null) {
      $result.fields.addAll(fields);
    }
    if (q != null) {
      $result.q = q;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (peer != null) {
      $result.peer = peer;
    }
    return $result;
  }
  ChatMessagesRequest._() : super();
  factory ChatMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChatMessagesRequest_Chat> _ChatMessagesRequest_ChatByTag = {
    6 : ChatMessagesRequest_Chat.chatId,
    7 : ChatMessagesRequest_Chat.peer,
    0 : ChatMessagesRequest_Chat.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.chat'), createEmptyInstance: create)
    ..oo(0, [6, 7])
    ..aOM<ChatMessagesRequest_Offset>(1, _omitFieldNames ? '' : 'offset', subBuilder: ChatMessagesRequest_Offset.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'fields')
    ..aOS(5, _omitFieldNames ? '' : 'q')
    ..aOS(6, _omitFieldNames ? '' : 'chatId')
    ..aOM<$7.Peer>(7, _omitFieldNames ? '' : 'peer', subBuilder: $7.Peer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessagesRequest clone() => ChatMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessagesRequest copyWith(void Function(ChatMessagesRequest) updates) => super.copyWith((message) => updates(message as ChatMessagesRequest)) as ChatMessagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessagesRequest create() => ChatMessagesRequest._();
  ChatMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<ChatMessagesRequest> createRepeated() => $pb.PbList<ChatMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessagesRequest>(create);
  static ChatMessagesRequest? _defaultInstance;

  ChatMessagesRequest_Chat whichChat() => _ChatMessagesRequest_ChatByTag[$_whichOneof(0)]!;
  void clearChat() => clearField($_whichOneof(0));

  /// Offset messages.
  @$pb.TagNumber(1)
  ChatMessagesRequest_Offset get offset => $_getN(0);
  @$pb.TagNumber(1)
  set offset(ChatMessagesRequest_Offset v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);
  @$pb.TagNumber(1)
  ChatMessagesRequest_Offset ensureOffset() => $_ensure(0);

  /// Number of messages to return.
  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  /// Fields to return into result.
  @$pb.TagNumber(3)
  $core.List<$core.String> get fields => $_getList(2);

  /// Search term: message.text
  @$pb.TagNumber(5)
  $core.String get q => $_getSZ(3);
  @$pb.TagNumber(5)
  set q($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasQ() => $_has(3);
  @$pb.TagNumber(5)
  void clearQ() => clearField(5);

  /// Unique chat dialog
  @$pb.TagNumber(6)
  $core.String get chatId => $_getSZ(4);
  @$pb.TagNumber(6)
  set chatId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasChatId() => $_has(4);
  @$pb.TagNumber(6)
  void clearChatId() => clearField(6);

  /// Unique peer contact
  @$pb.TagNumber(7)
  $7.Peer get peer => $_getN(5);
  @$pb.TagNumber(7)
  set peer($7.Peer v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPeer() => $_has(5);
  @$pb.TagNumber(7)
  void clearPeer() => clearField(7);
  @$pb.TagNumber(7)
  $7.Peer ensurePeer() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
