import 'package:flutter/services.dart';

class OpenFileService {
  static const MethodChannel _channel =
      MethodChannel('doclock/open_file');

  static void listen(
    Future<void> Function(String uri) onOpen,
  ) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'openFile') {
        final uri = call.arguments as String?;

        if (uri != null) {
          await onOpen(uri);
        }
      }
    });
  }
}