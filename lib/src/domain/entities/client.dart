import 'package:webitel_portal_sdk/src/communication/call_handler.dart';
import 'package:webitel_portal_sdk/src/communication/chat_handler.dart';
import 'package:webitel_portal_sdk/src/domain/entities/channel.dart';
import 'package:webitel_portal_sdk/src/domain/entities/response.dart';

abstract interface class Client {
  Future<ResponseEntity> logout();

  Future<Channel> getChannel();

  Future<ResponseEntity> registerDevice();

  Future<ResponseEntity> login({
    required String name,
    required String sub,
    required String issuer,
  });

  ChatHandler get chatHandler;

  CallHandler get callHandler;
}
