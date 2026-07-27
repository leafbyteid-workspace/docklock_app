import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_typography.dart';

enum TipeToast {
  sukses,
  gagal,
  peringatan,
}

class AppToast {
  AppToast._();

  static void sukses({
    required String title,
  }) {
    _show(
      type: TipeToast.sukses,
      title: title,
    );
  }

  static void gagal({
    required String title,
  }) {
    _show(
      type: TipeToast.gagal,
      title: title,
    );
  }

  static void peringatan({
    required String title,
  }) {
    _show(
      type: TipeToast.peringatan,
      title: title,
    );
  }

  static void _show({
    required TipeToast type,
    required String title,
  }) {
    final context = Get.context;
    if (context == null) return;

    final width = MediaQuery.of(context).size.width;

    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 32,
      ),
      padding: EdgeInsets.zero,
      borderRadius: 0,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      animationDuration: const Duration(milliseconds: 250),
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      messageText: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: width > 600 ? 360 : width * .82,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF323232),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTypography.callout(
              fontWeight: AppTypography.medium,
            ).copyWith(
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
