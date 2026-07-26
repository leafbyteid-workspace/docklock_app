import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_typography.dart';

class AppProfileCard extends StatelessWidget {
  final String? photoUrl;
  final String title;
  final String subtitle;
  final String caption;
  final String status;
  final Color statusColor;
  final VoidCallback? onTap;

  const AppProfileCard({
    super.key,
    this.photoUrl,
    required this.title,
    required this.subtitle,
    this.caption = "Pengguna",
    this.status = "Aktif",
    this.statusColor = const Color(0xFF16A34A),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black.withOpacity(.1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: title,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColor.primary.withOpacity(.08),
                    backgroundImage: (photoUrl != null && photoUrl!.isNotEmpty)
                        ? NetworkImage(photoUrl!)
                        : null,
                    child: (photoUrl == null || photoUrl!.isEmpty)
                        ? const Icon(
                            Symbols.person_rounded,
                            size: 26,
                            color: AppColor.primary,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.subhead().copyWith(
                          fontWeight: AppTypography.bold,
                          color: AppColor.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.footnote().copyWith(
                          color: AppColor.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: AppTypography.badge.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Symbols.person_rounded,
                          size: 14,
                          color: AppColor.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          caption,
                          style: AppTypography.badge.copyWith(
                            color: AppColor.primary,
                            fontWeight: AppTypography.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
