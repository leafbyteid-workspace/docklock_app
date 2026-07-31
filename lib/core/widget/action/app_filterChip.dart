import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_typography.dart';

enum FilterChipIconPosition {
  leading,
  trailing,
}

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    required this.title,
    required this.selected,
    required this.onTap,
    this.icon,
    this.iconPosition = FilterChipIconPosition.leading,
    this.iconSize = 18,
    this.iconTextSpacing = 8,
    super.key,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;
  final FilterChipIconPosition iconPosition;
  final double iconSize;
  final double iconTextSpacing;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        selected ? AppColor.primary : AppColor.surfaceVariant;

    final borderColor = selected ? AppColor.primary : AppColor.borderDefault;

    final foregroundColor =
        selected ? AppColor.onPrimary : AppColor.textSecondary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: AppColor.primary.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          highlightColor:
              selected ? AppColor.hover.withOpacity(0.2) : AppColor.hover,
          splashColor:
              selected ? AppColor.pressed.withOpacity(0.2) : AppColor.pressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: _buildContent(
              foregroundColor: foregroundColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent({
    required Color foregroundColor,
  }) {
    final titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTypography.chip.copyWith(
        color: foregroundColor,
        fontWeight: selected ? AppTypography.semiBold : AppTypography.medium,
      ),
    );

    if (icon == null) {
      return Center(
        child: titleWidget,
      );
    }

    final iconWidget = Icon(
      icon,
      size: iconSize,
      color: foregroundColor,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconPosition == FilterChipIconPosition.leading
          ? [
              iconWidget,
              SizedBox(width: iconTextSpacing),
              Flexible(
                child: titleWidget,
              ),
            ]
          : [
              Flexible(
                child: titleWidget,
              ),
              SizedBox(width: iconTextSpacing),
              iconWidget,
            ],
    );
  }
}
