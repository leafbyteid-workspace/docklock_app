import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/errors/app_confirmationAlert.dart';
import '../../../../localization/locale_keys.dart';
import 'app_exit.dart';

class AppConnectionDialog {
  AppConnectionDialog._();

  static Future<void> noConnection(
    BuildContext context,
  ) async {
    final result = await ShowConfirmationDialog.show(
      context: context,
      title: LocaleKeys.noInternetConnection.tr,
      subtitle: LocaleKeys.noInternetConnectionDesc.tr,
      confirmText: LocaleKeys.understood.tr,
      cancelText: "",
      type: ConfirmationDialogType.warning,
    );

    if (result) {
      AppExit.exit();
    }
  }
}
