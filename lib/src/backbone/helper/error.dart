class ErrorHelper {
  /// Extracts the error code from a given message string.
  ///
  /// This method uses a regular expression to find the pattern `"code":<number>`
  /// in the input message string and extracts the number as a string.
  ///
  /// Returns the extracted error code as a string if found, otherwise returns 'Unknown'.
  ///
  /// [message] The message string containing the error code.
  static String getCodeFromMessage(String message) {
    // Define the regular expression to match the pattern "code":<number>
    RegExp regExp = RegExp(r'"code":(\d+)');

    // Search for the pattern in the given message string
    Match? match = regExp.firstMatch(message);

    // If a match is found, return the captured group (error code)
    // Otherwise, return 'Unknown'
    String code = match != null ? match.group(1) ?? 'Unknown' : 'Unknown';

    return code;
  }
}
