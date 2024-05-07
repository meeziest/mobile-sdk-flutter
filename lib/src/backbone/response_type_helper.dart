import 'package:webitel_portal_sdk/src/domain/entities/response_type.dart';
import 'package:webitel_portal_sdk/src/generated/portal/connect.pb.dart';
import 'package:webitel_portal_sdk/src/generated/portal/messages.pb.dart';

class ResponseTypeHelper {
  static const ResponseType updateNewMessage = ResponseType.updateNewMessage;
  static const ResponseType response = ResponseType.response;
  static const ResponseType error = ResponseType.error;

  static ResponseType determineResponseType(Update update) {
    if (update.data.canUnpackInto(Response())) {
      Response response = update.data.unpackInto(Response());
      if (response.err.hasMessage()) {
        return ResponseType.error;
      }
      return ResponseType.response;
    } else if (update.data.canUnpackInto(UpdateNewMessage())) {
      return ResponseType.updateNewMessage;
    } else {
      throw Exception('Unknown type');
    }
  }
}
