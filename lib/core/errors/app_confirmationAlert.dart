import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../constants/app_typography.dart';
import '../widget/action/app_button.dart';

enum ConfirmationDialogType {
  danger,
  warning,
  success,
  neutral,
}

class ShowConfirmationDialog {
  ShowConfirmationDialog._();

  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String subtitle,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    IconData? icon,
    ConfirmationDialogType type = ConfirmationDialogType.neutral,
    bool barrierDismissible = true,
  }) async {
    final config = _DialogConfig.fromType(
      context,
      type,
    );

    final result = await Get.dialog<bool>(
      Dialog(
        elevation: 0,
        backgroundColor: context.appTheme.surfaceElevated,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: config.iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon ?? config.icon,
                  size: 28,
                  color: config.iconColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTypography.title3(
                  fontWeight: AppTypography.semiBold,
                ).copyWith(
                  color: context.appTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTypography.subhead(
                  fontWeight: AppTypography.regular,
                ).copyWith(
                  color: context.appTheme.textSecondary,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  AppButton(
                    text: confirmText,
                    type: _getButtonType(type),
                    onPressed: () {
                      Get.back(result: true);
                    },
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    text: cancelText,
                    type: AppTipeTombol.secondary,
                    onPressed: () {
                      Get.back(result: false);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: context.appTheme.overlay,
    );

    return result ?? false;
  }

  static AppTipeTombol _getButtonType(
    ConfirmationDialogType type,
  ) {
    switch (type) {
      case ConfirmationDialogType.danger:
        return AppTipeTombol.danger;

      case ConfirmationDialogType.warning:
        return AppTipeTombol.primary;

      case ConfirmationDialogType.success:
        return AppTipeTombol.primary;

      case ConfirmationDialogType.neutral:
        return AppTipeTombol.primary;
    }
  }
}

class _DialogConfig {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color buttonColor;
  final Color buttonTextColor;

  const _DialogConfig({
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  factory _DialogConfig.fromType(
      BuildContext context, ConfirmationDialogType type) {
    switch (type) {
      case ConfirmationDialogType.danger:
        return _DialogConfig(
          icon: Symbols.delete_rounded,
          iconColor: context.appTheme.danger,
          iconBackgroundColor: context.appTheme.danger.withOpacity(0.10),
          buttonColor: context.appTheme.danger,
          buttonTextColor: context.appTheme.onSemantic,
        );

      case ConfirmationDialogType.warning:
        return _DialogConfig(
          icon: Symbols.warning_rounded,
          iconColor: context.appTheme.warning,
          iconBackgroundColor: context.appTheme.warning.withOpacity(0.12),
          buttonColor: context.appTheme.warning,
          buttonTextColor: context.appTheme.textPrimary,
        );

      case ConfirmationDialogType.success:
        return _DialogConfig(
          icon: Symbols.check_circle_rounded,
          iconColor: context.appTheme.success,
          iconBackgroundColor: context.appTheme.success.withOpacity(0.10),
          buttonColor: context.appTheme.success,
          buttonTextColor: context.appTheme.onSemantic,
        );

      case ConfirmationDialogType.neutral:
        return _DialogConfig(
          icon: Symbols.help_rounded,
          iconColor: context.appTheme.primary,
          iconBackgroundColor: context.appTheme.primary.withOpacity(0.10),
          buttonColor: context.appTheme.primary,
          buttonTextColor: context.appTheme.onPrimary,
        );
    }
  }
}
