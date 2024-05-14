import 'package:webitel_portal_sdk/src/communication/call_handler.dart';
import 'package:webitel_portal_sdk/src/communication/chat_handler.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';

abstract interface class Client {
  Future<Response> logout();

  Future<Channel> getChannel();

  Future<Response> registerDevice();

  Future<Response> login({
    required String name,
    required String sub,
    required String issuer,
  });

  ChatHandler get chatHandler;

  CallHandler get callHandler;
}
