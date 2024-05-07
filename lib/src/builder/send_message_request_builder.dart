import 'package:webitel_portal_sdk/src/generated/chat/messages/peer.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

class SendMessageRequestBuilder {
  late String text;
  late Peer peer;

  SendMessageRequestBuilder setText(String text) {
    this.text = text;
    return this;
  }

  SendMessageRequestBuilder setPeer(Peer peer) {
    this.peer = peer;
    return this;
  }

  SendMessageRequest build() {
    return SendMessageRequest(
      text: text,
      peer: peer,
    );
  }
}
