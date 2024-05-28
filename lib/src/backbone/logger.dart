import 'package:logging/logging.dart';
import 'package:webitel_portal_sdk/src/domain/entities/logger_level.dart';

/// The `CustomLogger` class provides a custom logging utility for the application.
///
/// It allows initialization of the logging system with a specified logging level
/// and provides a method to get a logger instance for a specific class.
final class CustomLogger {
  /// Initializes the logging system with the specified logging level.
  ///
  /// [loggerLevel] The logging level to be used for the root logger.
  static void initialize({required LoggerLevel loggerLevel}) {
    // Set the root logger's level based on the provided logger level.
    Logger.root.level = _getLogLevel(loggerLevel);

    // Listen for log records and print them to the console if they meet the root logger's level.
    Logger.root.onRecord.listen(
      (record) {
        if (record.level >= Logger.root.level) {
          print(
            '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}: ${record.error ?? ''}',
          );
        }
      },
    );
  }

  /// Returns a logger instance for the specified class name.
  ///
  /// [className] The name of the class for which the logger instance is created.
  ///
  /// Returns a [Logger] instance for the specified class name.
  static Logger getLogger(String className) {
    return Logger(className);
  }

  /// Converts the custom [LoggerLevel] to the corresponding `Level` in the logging package.
  ///
  /// [level] The custom logger level.
  ///
  /// Returns the corresponding `Level` in the logging package.
  static Level _getLogLevel(LoggerLevel level) {
    switch (level) {
      case LoggerLevel.debug:
        return Level.ALL;
      case LoggerLevel.warning:
        return Level.WARNING;
      case LoggerLevel.error:
        return Level.SEVERE;
      case LoggerLevel.off:
        return Level.OFF;
    }
  }
}
