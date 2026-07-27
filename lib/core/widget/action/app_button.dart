import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_typography.dart';

enum AppTipeTombol {
  primary,
  secondary,
  tertiary,
  danger,
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppTipeTombol type;
  final String? iconAsset;
  final double iconSize;
  final bool isLoading;
  final bool enabled;
  final double height;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppTipeTombol.primary,
    this.iconAsset,
    this.iconSize = 20,
    this.isLoading = false,
    this.enabled = true,
    this.height = 48,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = !enabled || isLoading;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: _buildButton(
        isDisabled,
        _buildChild(isDisabled),
      ),
    );
  }

  Widget _buildChild(bool isDisabled) {
    if (isLoading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: _foregroundColor(isDisabled),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconAsset != null) ...[
          Image.asset(
            iconAsset!,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(bool isDisabled, Widget child) {
    switch (type) {
      case AppTipeTombol.primary:
        return FilledButton(
          onPressed: isDisabled ? null : onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.onPrimary,
            disabledBackgroundColor: AppColor.disabledBackground,
            disabledForegroundColor: AppColor.disabledText,
            elevation: 0,
            textStyle: AppTypography.buttonPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: child,
        );

      case AppTipeTombol.secondary:
        return OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColor.textTertiary,
            disabledForegroundColor: AppColor.disabledText,
            side: BorderSide(
              color:
                  isDisabled ? AppColor.disabledBorder : AppColor.borderDefault,
              width: 1.5,
            ),
            textStyle: AppTypography.buttonSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: child,
        );

      case AppTipeTombol.tertiary:
        return TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColor.textLink,
            disabledForegroundColor: AppColor.disabledText,
            textStyle: AppTypography.bodyPrimary(
              fontWeight: AppTypography.bold,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
          child: child,
        );

      case AppTipeTombol.danger:
        return FilledButton(
          onPressed: isDisabled ? null : onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppColor.danger,
            foregroundColor: AppColor.onSemantic,
            disabledBackgroundColor: AppColor.disabledBackground,
            disabledForegroundColor: AppColor.disabledText,
            elevation: 0,
            textStyle: AppTypography.buttonPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: child,
        );
    }
  }

  Color _foregroundColor(bool isDisabled) {
    if (isDisabled) return AppColor.disabledText;

    switch (type) {
      case AppTipeTombol.primary:
        return AppColor.onPrimary;
      case AppTipeTombol.secondary:
      case AppTipeTombol.tertiary:
        return AppColor.primary;
      case AppTipeTombol.danger:
        return AppColor.onSemantic;
    }
  }
}

class AppFloatingButton extends StatelessWidget {
  final VoidCallback onTap;

  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  final double? elevation;
  final double? borderRadius;

  const AppFloatingButton({
    super.key,
    required this.onTap,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: backgroundColor ?? AppColor.primary,
      elevation: elevation ?? 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 14),
      ),
      child: Icon(
        icon ?? Icons.add_rounded,
        color: iconColor ?? AppColor.onPrimary,
        size: iconSize ?? 30,
      ),
    );
  }
}
