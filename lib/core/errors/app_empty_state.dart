import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';

import '../constants/app_typography.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonLabel,
    this.onAdd,
    this.iconSize = 56,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 48,
    ),
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonLabel;
  final VoidCallback? onAdd;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  bool get _showButton =>
      buttonLabel != null && buttonLabel!.trim().isNotEmpty && onAdd != null;

  @override
  Widget build(BuildContext context) {
    final containerSize = iconSize + 40;

    return Padding(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 380,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: containerSize,
                height: containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.appTheme.hover,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.appTheme.borderSubtle,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.appTheme.primary.withOpacity(0.08),
                      blurRadius: 24,
                      spreadRadius: 4,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: iconSize,
                  color: context.appTheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTypography.title2(
                  fontWeight: AppTypography.bold,
                ).copyWith(
                  color: context.appTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall(
                  fontWeight: AppTypography.regular,
                ).copyWith(
                  color: context.appTheme.textSecondary,
                  height: 1.5,
                ),
              ),
              if (_showButton) ...[
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: onAdd,
                  style: FilledButton.styleFrom(
                    backgroundColor: context.appTheme.primary,
                    foregroundColor: context.appTheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  icon: Icon(
                    Icons.add_rounded,
                    size: 20,
                    color: context.appTheme.onPrimary,
                  ),
                  label: Text(
                    buttonLabel!,
                    style: AppTypography.buttonPrimary.copyWith(
                      color: context.appTheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
