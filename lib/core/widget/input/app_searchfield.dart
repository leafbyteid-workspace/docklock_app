import 'package:doclock_app/core/theme/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../constants/app_typography.dart';

class AppSearchField extends StatelessWidget {
  final TextEditingController? controller;

  final String? hint;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final VoidCallback? onFilterTap;
  final VoidCallback? onClear;

  final bool enabled;
  final bool autofocus;
  final bool showFilter;
  final bool showClearButton;

  final int filterCount;

  const AppSearchField({
    super.key,
    this.controller,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.onFilterTap,
    this.onClear,
    this.enabled = true,
    this.autofocus = false,
    this.showFilter = false,
    this.showClearButton = true,
    this.filterCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final hasText = controller?.text.isNotEmpty ?? false;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: enabled
                  ? context.appTheme.surface
                  : context.appTheme.disabledBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: context.appTheme.borderDefault,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                Icon(
                  Symbols.search_rounded,
                  size: 22,
                  color: context.appTheme.iconSecondary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: controller,
                    enabled: enabled,
                    autofocus: autofocus,
                    cursorColor: context.appTheme.primary,
                    style: AppTypography.bodyPrimary(),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: hint ?? "Cari...",
                      hintStyle: AppTypography.bodyPrimary().copyWith(
                        color: context.appTheme.textMuted,
                      ),
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                  ),
                ),
                if (showClearButton && hasText)
                  IconButton(
                    splashRadius: 18,
                    icon: const Icon(
                      Symbols.close_rounded,
                      size: 18,
                    ),
                    onPressed: onClear,
                  ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
        if (showFilter) ...[
          const SizedBox(width: 12),
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onFilterTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: context.appTheme.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Symbols.tune_rounded,
                    color: Colors.white,
                  ),
                ),
                if (filterCount > 0)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: context.appTheme.danger,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filterCount > 9 ? "9+" : filterCount.toString(),
                        style: AppTypography.caption1().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
