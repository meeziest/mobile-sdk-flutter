final class Constants {
  Constants._();

  static const String sdkName = 'webitel_portal_sdk';
  static const String sdkVersion = '1.0.1';
  static const String fetchDialogsPath = '/webitel.portal'
      '.ChatMessages/ChatDialogs';
  static const String chatUpdatesPath = '/webitel.portal'
      '.ChatMessages/ChatUpdates';
  static const String sendMessagePath = '/webitel.portal'
      '.ChatMessages/SendMessage';
  static const String chatHistoryPath =
      '/webitel.portal.ChatMessages/ChatHistory';
  static const Duration requestTimeout = Duration(seconds: 5);
}
