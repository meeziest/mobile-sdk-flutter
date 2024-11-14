import 'package:webitel_portal_sdk/src/domain/entities/call_error.dart';
import 'package:webitel_portal_sdk/src/domain/entities/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file_response.dart';
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
      error: CallError(
        errorMessage: _dialogMessageContent,
      ),
      input: false,
      messageId: 0,
      dialogMessageContent: '',
      requestId: _requestId,
      peer: peerInfo,
      file: MediaFileResponse.initial(),
      timestamp: 0,
    );
  }
}
