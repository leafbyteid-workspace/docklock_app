import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../constants/app_color.dart';
import '../constants/app_typography.dart';

enum SnackbarType {
  sukses,
  gagal,
  peringatan,
}

class AppSnackbar {
  AppSnackbar._();

  static void sukses({
    required String title,
    required String message,
  }) {
    _show(
      type: SnackbarType.sukses,
      title: title,
      message: message,
    );
  }

  static void gagal({
    required String title,
    required String message,
  }) {
    _show(
      type: SnackbarType.gagal,
      title: title,
      message: message,
    );
  }

  static void peringatan({
    required String title,
    required String message,
  }) {
    _show(
      type: SnackbarType.peringatan,
      title: title,
      message: message,
    );
  }

  static void _show({
    required SnackbarType type,
    required String title,
    required String message,
  }) {
    final config = _SnackbarConfig.fromType(type);
    final context = Get.context;
    if (context == null) return;

    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      boxShadows: const [],
      borderWidth: 0,
      borderRadius: 0,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      titleText: const SizedBox.shrink(),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      animationDuration: Duration.zero,
      messageText: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 460,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.surfaceElevated,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColor.borderSubtle,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: config.backgroundIconColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          config.icon,
                          color: config.iconColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTypography.subhead(
                                fontWeight: AppTypography.semiBold,
                              ).copyWith(
                                color: AppColor.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message,
                              softWrap: true,
                              style: AppTypography.callout().copyWith(
                                color: AppColor.textSecondary,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          if (Get.isSnackbarOpen) {
                            Get.closeCurrentSnackbar();
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Symbols.close_rounded,
                            size: 18,
                            color: AppColor.iconSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SnackbarConfig {
  final IconData icon;
  final Color iconColor;
  final Color backgroundIconColor;

  _SnackbarConfig({
    required this.icon,
    required this.iconColor,
    required this.backgroundIconColor,
  });

  factory _SnackbarConfig.fromType(SnackbarType type) {
    switch (type) {
      case SnackbarType.sukses:
        return _SnackbarConfig(
          icon: Symbols.check_circle_rounded,
          iconColor: AppColor.success,
          backgroundIconColor: AppColor.success.withOpacity(0.12),
        );

      case SnackbarType.gagal:
        return _SnackbarConfig(
          icon: Symbols.cancel_rounded,
          iconColor: AppColor.danger,
          backgroundIconColor: AppColor.danger.withOpacity(0.12),
        );

      case SnackbarType.peringatan:
        return _SnackbarConfig(
          icon: Symbols.dangerous_rounded,
          iconColor: const Color(0xFFE6A700),
          backgroundIconColor: AppColor.danger.withOpacity(0.15),
        );
    }
  }
}
