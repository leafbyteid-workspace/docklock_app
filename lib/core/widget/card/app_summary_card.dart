import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';

import '../../constants/app_typography.dart';

class AppSummaryCard extends StatelessWidget {
  final List<AppItemRingkasan> items;

  const AppSummaryCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.appTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.appTheme.borderSubtle,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: context.appTheme.surfaceVariant.withOpacity(0.03),
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: context.appTheme.surfaceVariant.withOpacity(0.02),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 360;
          final verticalPadding = isCompact ? 16.0 : 20.0;
          final horizontalPadding = isCompact ? 8.0 : 12.0;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  items.length,
                  (index) {
                    final item = items[index];

                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: isCompact ? 42 : 48,
                                    height: isCompact ? 42 : 48,
                                    decoration: BoxDecoration(
                                      color: context.appTheme.primary
                                          .withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        item.icon,
                                        color: context.appTheme.primary,
                                        size: isCompact ? 20 : 22,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      item.count,
                                      style: AppTypography.title2(
                                        fontWeight: AppTypography.bold,
                                      ).copyWith(
                                        color: context.appTheme.textPrimary,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.title,
                                    style: AppTypography.subhead(
                                      fontWeight: AppTypography.semiBold,
                                    ).copyWith(
                                      color: context.appTheme.textPrimary,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.subtitle,
                                    style: AppTypography.caption1(
                                      fontWeight: AppTypography.regular,
                                    ).copyWith(
                                      color: context.appTheme.textSecondary,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (index != items.length - 1)
                            Container(
                              width: 1,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              color: context.appTheme.borderDefault,
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppItemRingkasan {
  final IconData icon;
  final String count;
  final String title;
  final String subtitle;

  const AppItemRingkasan({
    required this.icon,
    required this.count,
    required this.title,
    required this.subtitle,
  });
}
