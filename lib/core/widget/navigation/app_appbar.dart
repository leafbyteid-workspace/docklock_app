import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_color.dart';
import '../../constants/app_typography.dart';

class AppBarPengguna extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPengguna({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onBackPressed,
    this.actionIcon1,
    this.onAction1,
    this.actionIcon2,
    this.onAction2,
    this.backgroundColor = AppColor.primary,
  });

  final String title;

  final String? subtitle;

  final Color backgroundColor;

  final bool showBackButton;
  final VoidCallback? onBackPressed;

  final IconData? actionIcon1;
  final VoidCallback? onAction1;

  final IconData? actionIcon2;
  final VoidCallback? onAction2;

  @override
  Size get preferredSize => Size.fromHeight(
        subtitle == null ? 56 : 64,
      );
  @override
  Widget build(BuildContext context) {
    final bool hasBackButton = showBackButton;
    final bool hasAction = actionIcon1 != null || actionIcon2 != null;

    final bool hasSubtitle = subtitle != null;

    final bool centerTitle = (!hasBackButton && !hasAction) ||
        (hasBackButton && hasAction && hasSubtitle);

    return Material(
      color: backgroundColor,
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    if (hasBackButton)
                      IconButton(
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColor.iconInverse,
                        ),
                        onPressed: onBackPressed ??
                            () {
                              if (Get.key.currentState?.canPop() ?? false) {
                                Get.back();
                              }
                            },
                      ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (actionIcon1 != null)
                          IconButton(
                            onPressed: onAction1,
                            splashRadius: 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                            visualDensity: VisualDensity.compact,
                            icon: Icon(
                              actionIcon1,
                              color: AppColor.iconInverse,
                            ),
                          ),
                        if (actionIcon2 != null) const SizedBox(width: 4),
                        if (actionIcon2 != null)
                          IconButton(
                            onPressed: onAction2,
                            splashRadius: 20,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                            visualDensity: VisualDensity.compact,
                            icon: Icon(
                              actionIcon2,
                              color: AppColor.iconInverse,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment:
                      centerTitle ? Alignment.center : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: centerTitle ? 0 : (hasBackButton ? 56 : 0),
                      right: centerTitle
                          ? 0
                          : (actionIcon1 != null && actionIcon2 != null
                              ? 76
                              : actionIcon1 != null
                                  ? 38
                                  : 0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: centerTitle
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign:
                              centerTitle ? TextAlign.center : TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.title3().copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.textInverse,
                          ),
                        ),
                        if (hasSubtitle) ...[
                          const SizedBox(height: 1),
                          Text(
                            subtitle!,
                            textAlign: centerTitle
                                ? TextAlign.center
                                : TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodySmall().copyWith(
                              color: AppColor.textInverse,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
