import 'package:logging/logging.dart';

class CustomLogger {
  static void initialize() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(
      (record) {
        print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
        );
      },
    );
  }

  static Logger getLogger(String className) {
    return Logger(className);
  }
}
