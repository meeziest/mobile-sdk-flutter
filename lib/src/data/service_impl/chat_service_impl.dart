import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:webitel_portal_sdk/src/backbone/logger.dart';
import 'package:webitel_portal_sdk/src/backbone/message_helper.dart';
import 'package:webitel_portal_sdk/src/builder/error_dialog_message_builder.dart';
import 'package:webitel_portal_sdk/src/builder/messages_list_message_builder.dart';
import 'package:webitel_portal_sdk/src/builder/response_dialog_message_builder.dart';
import 'package:webitel_portal_sdk/src/data/gateway/connect_listener_gateway.dart';
import 'package:webitel_portal_sdk/src/data/gateway/grpc_gateway.dart';
import 'package:webitel_portal_sdk/src/data/gateway/shared_preferences_gateway.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/history.pb.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/message.pb.dart'
    as file;
import 'package:webitel_portal_sdk/src/generated/chat/messages/peer.pb.dart';
import 'package:webitel_portal_sdk/src/generated/google/protobuf/any.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/connect.pb.dart'
    as portal;
import 'package:webitel_portal_sdk/src/generated/portal/media.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final ConnectListenerGateway _connectListenerGateway;
  final SharedPreferencesGateway _sharedPreferencesGateway;
  final GrpcGateway _grpcGateway;

  late final StreamController<DialogMessageResponseEntity>
      _userMessagesController;
  final uuid = Uuid();
  final log = CustomLogger.getLogger('ChatServiceImpl');

  ChatServiceImpl(
    this._grpcGateway,
    this._connectListenerGateway,
    this._sharedPreferencesGateway,
  ) {
    _userMessagesController =
        StreamController<DialogMessageResponseEntity>.broadcast();
    log.info("Chat service initialized with broadcast stream controller.");
  }

  /// Stream transformer that converts a stream of data chunks into a stream of UploadMedia messages.
  /// Firstly adding name/type and then bytes
  Stream<UploadMedia> stream({
    required Stream<List<int>> data,
    required String name,
    required String type,
  }) async* {
    yield UploadMedia(file: InputFile(name: name, type: type));

    await for (var bytes in data) {
      yield UploadMedia(data: bytes);
    }
  }

  /// Listens for all messages from server
  //TODO FILTER MESSAGES BY ROOMS AND MAKE 2 STREAMS - ROOM MESSAGES + ALL MESSAGES
  @override
  Future<StreamController<DialogMessageResponseEntity>>
      listenToMessages() async {
    await _sharedPreferencesGateway.init();
    final userId = await _sharedPreferencesGateway.readUserId();
    _connectListenerGateway.updateStream.listen((update) async {
      final messageType = MessageHelper.determineMessageTypeResponse(update);
      log.info("Received message update of type: $messageType");
      switch (messageType) {
        case MessageType.outcomingMedia:
          log.info(
              "Processing ${messageType.toString()} message: ${update.message.text}");
          final dialogMessage = ResponseDialogMessageBuilder()
              .setDialogMessageContent(update.message.text)
              .setId(update.id)
              .setRequestId(update.id)
              .setMessageId(update.id)
              .setUserUd(userId ?? '')
              .setId(update.id)
              .setChatId(update.message.chat.id)
              .setUpdate(update)
              .setFile(
                MediaFileResponseEntity(
                  id: update.message.file.id,
                  type: update.message.file.type,
                  name: update.message.file.name,
                  bytes: [],
                  size: update.message.file.size.toInt(),
                ),
              )
              .build();
          print(dialogMessage.file.name);
          _userMessagesController.add(dialogMessage);

        case MessageType.outcomingMessage:
          log.info(
              "Processing ${messageType.toString()} message: ${update.message.text}");
          final dialogMessage = ResponseDialogMessageBuilder()
              .setDialogMessageContent(update.message.text)
              .setId(update.id)
              .setRequestId(update.id)
              .setMessageId(update.id)
              .setUserUd(userId ?? '')
              .setId(update.id)
              .setChatId(update.message.chat.id)
              .setUpdate(update)
              .setFile(
                MediaFileResponseEntity(
                  id: update.message.file.id,
                  type: update.message.file.type,
                  name: update.message.file.name,
                  bytes: [],
                  size: update.message.file.size.toInt(),
                ),
              )
              .build();
          _userMessagesController.add(dialogMessage);

        case MessageType.incomingMedia:
          log.info(
              "Processing ${messageType.toString()} message: ${update.message.text}");
          final media = _grpcGateway.mediaStorageStub
              .getFile(GetFileRequest(fileId: update.message.file.id));

          MediaFileResponseEntity? file;

          await for (MediaFile mediaFile in media) {
            if (mediaFile.file.name.isNotEmpty) {
              file = MediaFileResponseEntity(
                size: mediaFile.file.size.toInt(),
                name: mediaFile.file.name,
                type: mediaFile.file.type,
                id: mediaFile.file.id,
                bytes: [],
              );
            } else if (file != null) {
              file = file.copyWith(
                  bytes: List<int>.from(file.bytes)..addAll(mediaFile.data));
            }
          }

          final dialogMessage = ResponseDialogMessageBuilder()
              .setDialogMessageContent(update.message.text)
              .setId(update.id)
              .setRequestId(update.id)
              .setMessageId(update.id)
              .setUserUd(userId ?? '')
              .setId(update.id)
              .setChatId(update.message.chat.id)
              .setUpdate(update)
              .setFile(
                MediaFileResponseEntity(
                  id: file != null ? file.id : '',
                  type: file != null ? file.type : '',
                  name: file != null ? file.name : '',
                  bytes: file != null ? file.bytes : [],
                  size: file != null ? file.size.toInt() : 0,
                ),
              )
              .build();
          _userMessagesController.add(dialogMessage);

        case MessageType.incomingMessage:
          log.info(
              "Processing ${messageType.toString()} message: ${update.message.text}");

          final dialogMessage = ResponseDialogMessageBuilder()
              .setDialogMessageContent(update.message.text)
              .setId(update.id)
              .setRequestId(update.id)
              .setMessageId(update.id)
              .setUserUd(userId ?? '')
              .setId(update.id)
              .setChatId(update.message.chat.id)
              .setUpdate(update)
              .setFile(
                MediaFileResponseEntity(
                  id: '',
                  type: '',
                  name: '',
                  bytes: [],
                  size: 0,
                ),
              )
              .build();
          _userMessagesController.add(dialogMessage);
      }
    }, onError: (error) {
      log.severe("Error while listening to messages: $error");
    }, onDone: () {
      log.severe("Error while listening to messages: stream is done");
    });
    return _userMessagesController;
  }

  /// Sends a message to the chat service and waits for a response.
  @override
  Future<DialogMessageResponseEntity> sendMessage(
      {required DialogMessageRequestEntity message}) async {
    try {
      final userId = await _sharedPreferencesGateway.readUserId();
      final messageType = MessageHelper.determineMessageTypeRequest(message);
      log.info("Sending message of type $messageType for user $userId");
      final request = await _buildRequest(message, userId ?? '', messageType);

      _connectListenerGateway.sendRequest(request);
      return await _listenForResponse(message.requestId, userId ?? '')
          .timeout(const Duration(seconds: 5));
    } on GrpcError catch (err) {
      log.severe("GRPC Error on sendMessage: ${err.toString()}");
      return ErrorDialogMessageBuilder()
          .setDialogMessageContent(err.toString())
          .setRequestId(message.requestId)
          .build();
    } on TimeoutException {
      log.warning("Timeout exception on sendMessage");
      return ErrorDialogMessageBuilder()
          .setDialogMessageContent('Message was not sent due to timeout')
          .setRequestId(message.requestId)
          .build();
    }
  }

  //LISTEN FOR RESPONSE BY EQUAL REQUEST ID
  Future<DialogMessageResponseEntity> _listenForResponse(
      String requestId, String userId) {
    final completer = Completer<DialogMessageResponseEntity>();
    StreamSubscription<portal.Response>? streamSubscription;
    streamSubscription = _connectListenerGateway.responseStream
        .where((response) => response.id == requestId)
        .listen((response) => _handleResponse(response, completer, userId),
            onError: (error) => _handleError(error, completer, requestId),
            onDone: () => streamSubscription?.cancel(),
            cancelOnError: true);
    return completer.future;
  }

  Future<void> _handleResponse(portal.Response response,
      Completer<DialogMessageResponseEntity> completer, String userId) async {
    if (response.data.canUnpackInto(UpdateNewMessage())) {
      final unpackedMessage = response.data.unpackInto(UpdateNewMessage());
      final messageType =
          MessageHelper.determineMessageTypeResponse(unpackedMessage);

      switch (messageType) {
        case MessageType.outcomingMessage:
          log.info("Handled response for message type $messageType");
          final dialogMessage = ResponseDialogMessageBuilder()
              .setDialogMessageContent(unpackedMessage.message.text)
              .setRequestId(unpackedMessage.id)
              .setId(unpackedMessage.id)
              .setUserUd(userId)
              .setMessageId(unpackedMessage.id)
              .setChatId(unpackedMessage.message.chat.id)
              .setUpdate(unpackedMessage)
              .build();
          completer.complete(dialogMessage);
          break;

        case MessageType.outcomingMedia:
          log.info("Handled response for message type $messageType");
          final dialogMessage = ResponseDialogMessageBuilder()
              .setDialogMessageContent(unpackedMessage.message.text)
              .setId(unpackedMessage.id)
              .setRequestId(unpackedMessage.id)
              .setMessageId(unpackedMessage.id)
              .setUserUd(userId)
              .setId(unpackedMessage.id)
              .setChatId(unpackedMessage.message.chat.id)
              .setUpdate(unpackedMessage)
              .setFile(
                MediaFileResponseEntity(
                  id: unpackedMessage.message.file.id,
                  type: unpackedMessage.message.file.type,
                  name: unpackedMessage.message.file.name,
                  bytes: [],
                  size: unpackedMessage.message.file.size.toInt(),
                ),
              )
              .build();
          completer.complete(dialogMessage);
          break;
        default:
          break;
      }
    } else if (response.err.hasMessage()) {
      completer.complete(ErrorDialogMessageBuilder()
          .setDialogMessageContent(response.err.message)
          .setRequestId(response.id)
          .build());
    }
  }

  void _handleError(Object error,
      Completer<DialogMessageResponseEntity> completer, String requestId) {
    final errorMessage =
        error is GrpcError ? error.toString() : 'Unknown error occurred';
    log.severe("Error on handling message response: $errorMessage");
    completer.complete(ErrorDialogMessageBuilder()
        .setDialogMessageContent(errorMessage)
        .setRequestId(requestId)
        .build());
  }

  Future<portal.Request> _buildRequest(DialogMessageRequestEntity message,
      String userId, MessageType messageType) async {
    log.info("Building request for message type $messageType");
    final peer = Peer(
        id: message.peer.id, type: message.peer.type, name: message.peer.name);
    final baseRequest =
        SendMessageRequest(text: message.dialogMessageContent, peer: peer);

    if (messageType == MessageType.outcomingMedia) {
      log.info("Uploading media for message.");
      final uploadedFile = await _grpcGateway.mediaStorageStub.uploadFile(
        stream(
          data: message.file.data,
          name: message.file.name,
          type: message.file.type,
        ),
      );
      baseRequest.file = file.File(
        id: uploadedFile.id,
        name: uploadedFile.name,
        type: uploadedFile.type,
      );
    }

    return portal.Request(
      path: '/webitel.portal.ChatMessages/SendMessage',
      data: Any.pack(baseRequest),
      id: message.requestId,
    );
  }

  //FETCH MESSAGES
  @override
  Future<List<DialogMessageResponseEntity>> fetchMessages(
      {int? limit, String? offset}) async {
    final chatId = await _sharedPreferencesGateway.getFromDisk('chatId');
    final userId = await _sharedPreferencesGateway.readUserId();
    final requestId = uuid.v4();
    log.info(
        'Fetching messages for chatId: $chatId with limit: ${limit ?? 20}');

    final fetchMessagesRequest =
        ChatMessagesRequest(chatId: chatId, limit: limit ?? 20);
    final request = portal.Request(
      path: '/webitel.portal.ChatMessages/ChatHistory',
      data: Any.pack(fetchMessagesRequest),
      id: requestId,
    );

    try {
      await _connectListenerGateway.sendRequest(request);
      final response = await _connectListenerGateway.responseStream
          .firstWhere((response) => response.id == requestId)
          .timeout(const Duration(seconds: 5));

      if (response.data.canUnpackInto(ChatMessages())) {
        final unpackedDialogMessages = response.data.unpackInto(ChatMessages());
        final messagesBuilder = MessagesListMessageBuilder()
            .setChatId(chatId ?? '')
            .setUserId(userId ?? '')
            .setMessages(unpackedDialogMessages.messages)
            .setPeers(unpackedDialogMessages.peers);

        final messages = messagesBuilder.build();
        log.info(
            'Successfully fetched ${messages.length} messages for chatId: $chatId');
        return messages;
      } else {
        log.severe(
            'Failed to unpack dialog messages for requestId: $requestId');
        return [];
      }
    } catch (e) {
      if (e is TimeoutException) {
        log.severe('Timeout while fetching messages for chatId: $chatId');
      } else {
        log.severe(
            'An error occurred while fetching messages for chatId: $chatId');
      }
      return [];
    }
  }

  //FETCH MESSAGES REVERSED FOR PAGINATION
  @override
  Future<List<DialogMessageResponseEntity>> fetchUpdates(
      {int? limit, String? offset}) async {
    final chatId = await _sharedPreferencesGateway.getFromDisk('chatId');
    final userId = await _sharedPreferencesGateway.readUserId();
    final requestId = uuid.v4();
    log.info(
        'Fetching message updates for chatId: $chatId with limit: ${limit ?? 20}');

    final fetchMessageUpdatesRequest =
        ChatMessagesRequest(chatId: chatId, limit: limit ?? 20);
    final request = portal.Request(
      path: '/webitel.portal.ChatMessages/ChatUpdates',
      data: Any.pack(fetchMessageUpdatesRequest),
      id: requestId,
    );

    try {
      _connectListenerGateway.sendRequest(request);
      final response = await _connectListenerGateway.responseStream
          .firstWhere((response) => response.id == requestId)
          .timeout(const Duration(seconds: 5));

      if (response.data.canUnpackInto(ChatMessages())) {
        final unpackedDialogMessages = response.data.unpackInto(ChatMessages());
        final messagesBuilder = MessagesListMessageBuilder()
            .setChatId(chatId ?? '')
            .setUserId(userId ?? '')
            .setMessages(unpackedDialogMessages.messages)
            .setPeers(unpackedDialogMessages.peers);

        final messages = messagesBuilder.build();
        log.info(
            'Successfully fetched ${messages.length} message updates for chatId: $chatId');
        return messages;
      } else {
        log.severe(
            'Failed to unpack dialog messages for requestId: $requestId');
        return [];
      }
    } catch (e) {
      if (e is TimeoutException) {
        log.severe(
            'Timeout while fetching message updates for chatId: $chatId');
      } else {
        log.severe(
            'An error occurred while fetching message updates for chatId: $chatId');
      }
      return [];
    }
  }

  @override
  Future<void> enterChat({required String chatId}) async {
    await _sharedPreferencesGateway.saveChatId(chatId);
  }

  @override
  Future<void> exitChat() async {
    await _sharedPreferencesGateway.deleteChatId();
  }

  void dispose() {
    _userMessagesController.close();
  }
}
