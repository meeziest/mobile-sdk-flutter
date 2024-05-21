class ErrorHelper {
  static String getCodeFromMessage(String message) {
    RegExp regExp = RegExp(r'"code":(\d+)');
    Match? match = regExp.firstMatch(message);
    String code = match != null ? match.group(1) ?? 'Unknown' : 'Unknown';

    return code;
  }
}
