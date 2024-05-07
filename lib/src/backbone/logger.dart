import 'dart:async';

import 'package:logging/logging.dart';

class CustomLogger {
  final logController = StreamController<String>.broadcast();

  static void initialize() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print(
        '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
      );
    });
  }

  static Logger getLogger(String className) {
    return Logger(className);
  }
}
