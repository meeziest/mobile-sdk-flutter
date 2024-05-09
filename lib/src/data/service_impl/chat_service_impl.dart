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
import 'package:webitel_portal_sdk/src/data/grpc/connect_listener_gateway.dart';
import 'package:webitel_portal_sdk/src/data/grpc/grpc_gateway.dart';
import 'package:webitel_portal_sdk/src/data/service_impl/dialog_impl.dart';
import 'package:webitel_portal_sdk/src/data/shared_preferences/shared_preferences_gateway.dart';
import 'package:webitel_portal_sdk/src/domain/entities/connect.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_request.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/message_type.dart';
import 'package:webitel_portal_sdk/src/domain/services/chat_service.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/dialog.pb.dart'
    as dialog;
import 'package:webitel_portal_sdk/src/generated/chat/messages/history.pb.dart';
import 'package:webitel_portal_sdk/src/generated/chat/messages/message.pb.dart'
    as file;
import 'package:webitel_portal_sdk/src/generated/google/protobuf/any.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/connect.pb.dart'
    as portal;
import 'package:webitel_portal_sdk/src/generated/portal/media.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';
import 'package:webitel_portal_sdk/webitel_portal_sdk.dart';

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final ConnectListenerGateway _connectListenerGateway;
  final SharedPreferencesGateway _sharedPreferencesGateway;
  final GrpcGateway _grpcGateway;
  final uuid = Uuid();
  final log = CustomLogger.getLogger('ChatServiceImpl');
  final Map<String, StreamController<DialogMessageResponseEntity>>
      _messageControllers = {};

  ChatServiceImpl(
    this._grpcGateway,
    this._connectListenerGateway,
    this._sharedPreferencesGateway,
  ) {
    listenToMessages();
    onConnectStreamStatusChange();
    onChannelStatusChange();
    log.info("Chat service initialized.");
  }

  Future<StreamController<DialogMessageResponseEntity>> getControllerForChat(
    String chatId,
  ) async {
    return _messageControllers.putIfAbsent(
      chatId,
      () => StreamController<DialogMessageResponseEntity>.broadcast(),
    );
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

  @override
  Future<Dialog> fetchServiceDialog() async {
    final requestId = uuid.v4();
    log.info('Initiating fetch for chat dialogs with request ID: $requestId');
    List<Dialog> dialogs = [];
    await _sharedPreferencesGateway.init();
    final chatDialogsRequest = dialog.ChatDialogsRequest();
    final request = portal.Request(
      path: '/webitel.portal.ChatMessages/ChatDialogs',
      data: Any.pack(chatDialogsRequest),
      id: requestId,
    );

    log.info('Sending request to fetch chat dialogs');
    await _connectListenerGateway.sendRequest(request);

    try {
      final response = await _connectListenerGateway.responseStream
          .firstWhere((response) => response.id == requestId);

      log.info('Received response for chat dialogs request ID: $requestId');
      if (response.data.canUnpackInto(ChatList())) {
        final unpackedDialogMessages = response.data.unpackInto(ChatList());

        if (unpackedDialogMessages.data.isNotEmpty) {
          log.info(
              'Successfully unpacked chat dialogs, saving first chat ID to preferences');
          _sharedPreferencesGateway.saveToDisk(
            'chatId',
            unpackedDialogMessages.data.first.id,
          );
          for (var dialog in unpackedDialogMessages.data) {
            await getControllerForChat(dialog.id);
          }
          for (var dialog in unpackedDialogMessages.data) {
            final controller = _messageControllers[dialog.id]!; //TODO
            dialogs.add(
              DialogImpl(
                topMessage: dialog.message.text,
                id: dialog.id,
                onNewMessage: controller.stream,
              ),
            );
          }
          log.info('Fetched dialogs: ${dialogs.length}');
          return dialogs.first;
        } else {
          log.info('No chat dialogs were returned in the response');
          return DialogImpl.initial();
        }
      } else {
        log.warning('Failed to unpack chat list for request ID: $requestId');
      }
    } catch (err) {
      log.severe(
        'Error fetching chat dialogs with request ID: $requestId',
      );
    }
    return DialogImpl.initial();
  }

  /// Listens for all messages from server
  Future<void> listenToMessages() async {
    await _sharedPreferencesGateway.init();
    final userId = await _sharedPreferencesGateway.readUserId();
    _connectListenerGateway.updateStream.listen((update) async {
      log.info("Message Controllers length: ${_messageControllers.length}");
      if (_messageControllers.containsKey(update.message.chat.id)) {
        final messageController = _messageControllers[update.message.chat.id];
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
            messageController?.add(dialogMessage);

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
            messageController?.add(dialogMessage);

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
            messageController?.add(dialogMessage);

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
                .setFile(MediaFileResponseEntity.initial())
                .build();
            messageController?.add(dialogMessage);
        }
      }
    }, onError: (error) {
      log.severe("Error while listening to messages: $error");
    }, onDone: () {
      log.severe("Error while listening to messages: stream is done");
    });
  }

  /// Sends a message to the chat service and waits for a response.
  @override
  Future<DialogMessageResponseEntity> sendMessage({
    required DialogMessageRequestEntity message,
    required String chatId,
  }) async {
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

  Future<void> _handleResponse(
    portal.Response response,
    Completer<DialogMessageResponseEntity> completer,
    String userId,
  ) async {
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
              .setFile(MediaFileResponseEntity.initial())
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

    final baseRequest = SendMessageRequest(
      text: message.dialogMessageContent,
    );

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
  Future<List<DialogMessageResponseEntity>> fetchMessages({
    int? limit,
    String? offset,
    required String chatId,
  }) async {
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
            .setChatId(chatId)
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
  Future<List<DialogMessageResponseEntity>> fetchUpdates({
    int? limit,
    String? offset,
    required String chatId,
  }) async {
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
            .setChatId(chatId)
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
  StreamController<ChannelStatus> onChannelStatusChange() {
    return _connectListenerGateway.chanelStatusStream;
  }

  @override
  StreamController<ConnectEntity> onConnectStreamStatusChange() {
    return _connectListenerGateway.connectStatusStream;
  }

// @override
// Future<List<Dialog>> fetchDialogs() async {
//   final requestId = uuid.v4();
//   log.info('Initiating fetch for chat dialogs with request ID: $requestId');
//   List<Dialog> dialogs = [];
//   await _sharedPreferencesGateway.init();
//   final chatDialogsRequest = dialog.ChatDialogsRequest();
//   final request = portal.Request(
//     path: '/webitel.portal.ChatMessages/ChatDialogs',
//     data: Any.pack(chatDialogsRequest),
//     id: requestId,
//   );
//
//   log.info('Sending request to fetch chat dialogs');
//   await _connectListenerGateway.sendRequest(request);
//
//   try {
//     final response = await _connectListenerGateway.responseStream
//         .firstWhere((response) => response.id == requestId);
//
//     log.info('Received response for chat dialogs request ID: $requestId');
//     if (response.data.canUnpackInto(ChatList())) {
//       final unpackedDialogMessages = response.data.unpackInto(ChatList());
//
//       if (unpackedDialogMessages.data.isNotEmpty) {
//         log.info(
//             'Successfully unpacked chat dialogs, saving first chat ID to preferences');
//         _sharedPreferencesGateway.saveToDisk(
//           'chatId',
//           unpackedDialogMessages.data.first.id,
//         );
//         for (var dialog in unpackedDialogMessages.data) {
//           await getControllerForChat(dialog.id);
//         }
//         for (var dialog in unpackedDialogMessages.data) {
//           final controller = _messageControllers[dialog.id]!; //TODO
//           dialogs.add(
//             DialogImpl(
//               topMessage: dialog.message.text,
//               id: dialog.id,
//               onNewMessage: controller.stream,
//             ),
//           );
//         }
//         log.info('Fetched dialogs: ${dialogs.length}');
//         return dialogs;
//       } else {
//         log.info('No chat dialogs were returned in the response');
//         return [];
//       }
//     } else {
//       log.warning('Failed to unpack chat list for request ID: $requestId');
//     }
//   } catch (err) {
//     log.severe(
//       'Error fetching chat dialogs with request ID: $requestId',
//     );
//   }
//   return [];
// }
}
