import 'package:webitel_portal_sdk/src/domain/entities/dialog_message/dialog_message_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/media_file/media_file_response.dart';
import 'package:webitel_portal_sdk/src/domain/entities/peer.dart';

class ErrorMessageBuilder {
  late String _errorMessage;

  ErrorMessageBuilder setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    return this;
  }

  DialogMessageResponseEntity build() {
    return DialogMessageResponseEntity(
      id: '',
      dialogMessageContent: _errorMessage,
      requestId: '',
      chatId: '',
      peer: PeerInfo(id: '', name: '', type: ''),
      file: MediaFileResponseEntity.initial(),
    );
  }
}
