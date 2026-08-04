import 'package:get/get.dart';

import 'alert_confirmation.dart';
import 'internet_service.dart';

class NetworkGuard {
  NetworkGuard._();

  static Future<bool> check() async {
    final connected = await InternetService.hasConnection();

    if (connected) return true;

    final context = Get.context;

    if (context != null && context.mounted) {
      await AppConnectionDialog.noConnection(context);
    }

    return false;
  }
}