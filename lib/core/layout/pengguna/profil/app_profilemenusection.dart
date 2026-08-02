import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_typography.dart';

class AppProfileMenuSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const AppProfileMenuSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              bottom: 10,
            ),
            child: Text(
              title.toUpperCase(),
              style: AppTypography.badge.copyWith(
                color: context.appTheme.textSecondary,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black.withOpacity(.05),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.03),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
