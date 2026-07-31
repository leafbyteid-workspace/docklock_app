import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/app_pages.dart';
import 'auth_service.dart';

class AuthGuardPengguna extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthServicePengguna>();

    if (!auth.authenticated.value) {
      return const RouteSettings(
        name: Routes.indexMasukPengguna,
      );
    }

    return null;
  }
}
