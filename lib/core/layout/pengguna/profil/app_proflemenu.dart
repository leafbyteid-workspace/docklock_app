import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../constants/app_typography.dart';

class AppProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  final Color? iconColor;
  final Color? textColor;
  final bool showDivider;

  const AppProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconColor,
    this.textColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final color = iconColor ?? theme.primary;
    final titleColor = textColor ?? theme.textPrimary;

    return Material(
      color: theme.surface,
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: theme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.borderSubtle,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: color.withOpacity(.10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTypography.subhead().copyWith(
                            fontWeight: AppTypography.semiBold,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: AppTypography.footnote().copyWith(
                            color: theme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Symbols.chevron_right_rounded,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              if (showDivider) ...[
                const SizedBox(height: 14),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.withOpacity(.10),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class AppDetailProfilMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  final VoidCallback? onTap;

  final Color? iconColor;
  final Color? valueColor;
  final bool showDivider;
  final bool enabled;

  const AppDetailProfilMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
    this.iconColor,
    this.valueColor,
    this.showDivider = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final Color baseIconColor = iconColor ?? theme.primary;
    final Color effectiveIconColor =
        enabled ? baseIconColor : theme.disabledIcon;
    final Color effectiveTitleColor =
        enabled ? theme.textSecondary : theme.disabledText;
    final Color effectiveValueColor =
        enabled ? (valueColor ?? theme.textPrimary) : theme.disabledText;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(16),
        splashColor: theme.hover,
        highlightColor: theme.pressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: enabled
                          ? effectiveIconColor.withOpacity(0.08)
                          : theme.disabledBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: enabled
                            ? effectiveIconColor.withOpacity(0.12)
                            : theme.borderSubtle,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: effectiveIconColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),

                  // TEXT CONTENT
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTypography.footnote().copyWith(
                            color: effectiveTitleColor,
                            fontWeight: AppTypography.medium,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          value,
                          style: AppTypography.bodyPrimary().copyWith(
                            color: effectiveValueColor,
                            fontWeight: AppTypography.semiBold,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (onTap != null && enabled) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: theme.surfaceVariant,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Symbols.edit_rounded,
                        size: 16,
                        color: theme.iconSecondary,
                      ),
                    ),
                  ],
                ],
              ),
              if (showDivider) ...[
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 58),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: theme.borderSubtle,
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
