import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';
import 'package:webitel_portal_sdk/src/managers/call.dart';
import 'package:webitel_portal_sdk/src/managers/chat.dart';

abstract interface class Client {
  Future<Response> logout();

  Future<Channel> getChannel();

  Future<Response> registerDevice({required String pushToken});

  Future<Response> login({
    required String name,
    required String sub,
    required String issuer,
  });

  ChatManager get chat;

  CallManager get call;
}
