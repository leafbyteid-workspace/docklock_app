import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_typography.dart';

enum ActivityStatus {
  sukses,
  diproses,
  gagal,
}

class AppActivityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;
  final ActivityStatus status;
  final VoidCallback? onTap;

  const AppActivityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.status,
    this.onTap,
  });

  Color get statusColor {
    switch (status) {
      case ActivityStatus.sukses:
        return Colors.green;
      case ActivityStatus.diproses:
        return Colors.orange;
      case ActivityStatus.gagal:
        return Colors.red;
    }
  }

  String get statusText {
    switch (status) {
      case ActivityStatus.sukses:
        return "Berhasil";
      case ActivityStatus.diproses:
        return "Diproses";
      case ActivityStatus.gagal:
        return "Gagal";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColor.borderSubtle,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColor.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: AppTypography.subhead().copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySmall().copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(.12),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    statusText,
                    style: AppTypography.caption1().copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: AppTypography.caption1().copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
