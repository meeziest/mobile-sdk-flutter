import 'package:logging/logging.dart';
import 'package:webitel_portal_sdk/src/domain/entities/logger_level.dart';

final class CustomLogger {
  static void initialize({required LoggerLevel loggerLevel}) {
    Logger.root.level = _getLogLevel(loggerLevel);
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

  static Logger getLogger(String className) {
    return Logger(className);
  }

  static Level _getLogLevel(LoggerLevel level) {
    switch (level) {
      case LoggerLevel.debug:
        return Level.ALL;
      case LoggerLevel.warning:
        return Level.WARNING;
      case LoggerLevel.error:
        return Level.SEVERE;
      default:
        return Level.INFO;
    }
  }
}
