import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../constants/app_color.dart';
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
    final color = iconColor ?? AppColor.primary;
    final titleColor = textColor ?? AppColor.textPrimary;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
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
                          color: AppColor.textSecondary,
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
    );
  }
}