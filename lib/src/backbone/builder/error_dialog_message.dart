import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';

final class ErrorDialogMessageBuilder {
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

  DialogMessageResponse build() {
    final peerInfo = PeerInfo(
      id: '',
      name: 'ERROR',
      type: 'Unknown',
    );

    return DialogMessageResponse(
      input: false,
      dialogMessageContent: _dialogMessageContent,
      requestId: _requestId,
      peer: peerInfo,
      file: MediaFileResponse.initial(),
      timestamp: 0,
    );
  }
}
