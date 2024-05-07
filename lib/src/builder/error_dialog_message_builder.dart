import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';

class ErrorDialogMessageBuilder {
  late String _dialogMessageContent;
  late String _requestId;

  ErrorDialogMessageBuilder setDialogMessageContent(
      String dialogMessageContent) {
    _dialogMessageContent = dialogMessageContent;
    return this;
  }

  ErrorDialogMessageBuilder setRequestId(String requestId) {
    _requestId = requestId;
    return this;
  }

  DialogMessageResponseEntity build() {
    final peerInfo = PeerInfo(
      id: '',
      name: 'ERROR',
      type: 'Unknown',
    );

    return DialogMessageResponseEntity(
      id: '',
      chatId: '',
      dialogMessageContent: _dialogMessageContent,
      requestId: _requestId,
      peer: peerInfo,
      messageId: '',
      file: MediaFileResponseEntity.initial(),
    );
  }
}
