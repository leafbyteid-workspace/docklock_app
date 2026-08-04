import 'dart:io' as io;
import 'package:flutter/services.dart';

class AppExit {
  AppExit._();

  static Future<void> exit() async {
    if (io.Platform.isAndroid) {
      await SystemNavigator.pop();
    } else if (io.Platform.isIOS) {
      io.exit(0);
    }
  }
}