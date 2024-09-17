import 'dart:developer';

class LogDebugger {
  static void logsFlag(String value, {String name = "", bool isDebug = true}) {
    if (isDebug) {
      log(value, name: name);
    }
  }
}
