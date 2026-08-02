import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'extensions/app_theme_extension.dart';

class AppLightTheme {
  AppLightTheme._();

  static ThemeData get theme {
    const colorScheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColor.primary,
      onPrimary: AppColor.onPrimary,
      secondary: AppColor.accent,
      onSecondary: AppColor.onAccent,
      surface: AppColor.surface,
      onSurface: AppColor.textPrimary,
      error: AppColor.danger,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      extensions: const [
        AppThemeExtension(
          background: AppColor.background,
          backgroundInverse: AppColor.backgroundInverse,
          surface: AppColor.surface,
          surfaceVariant: AppColor.surfaceVariant,
          surfaceElevated: AppColor.surfaceElevated,
          surfaceOverlay: AppColor.surfaceOverlay,
          surfaceInverse: AppColor.surfaceInverse,
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          accent: AppColor.accent,
          onPrimary: AppColor.onPrimary,
          onSecondary: AppColor.onSecondary,
          onAccent: AppColor.onAccent,
          onBackground: AppColor.onBackground,
          success: AppColor.success,
          info: AppColor.info,
          warning: AppColor.warning,
          danger: AppColor.danger,
          onSemantic: AppColor.onSemantic,
          textPrimary: AppColor.textPrimary,
          textSecondary: AppColor.textSecondary,
          textTertiary: AppColor.textTertiary,
          textMuted: AppColor.textMuted,
          textInverse: AppColor.textInverse,
          textLink: AppColor.textLink,
          iconPrimary: AppColor.iconPrimary,
          iconSecondary: AppColor.iconSecondary,
          iconDisabled: AppColor.iconDisabled,
          iconInverse: AppColor.iconInverse,
          borderDefault: AppColor.borderDefault,
          borderSubtle: AppColor.borderSubtle,
          borderStrong: AppColor.borderStrong,
          borderFocus: AppColor.borderFocus,
          divider: AppColor.divider,
          separator: AppColor.separator,
          disabledBackground: AppColor.disabledBackground,
          disabledText: AppColor.disabledText,
          disabledBorder: AppColor.disabledBorder,
          disabledIcon: AppColor.disabledIcon,
          overlay: AppColor.overlay,
          scrim: AppColor.scrim,
          backdrop: AppColor.backdrop,
          hover: AppColor.hover,
          pressed: AppColor.pressed,
          selected: AppColor.selected,
          focus: AppColor.focus,
          chart1: AppColor.chart1,
          chart2: AppColor.chart2,
          chart3: AppColor.chart3,
          chart4: AppColor.chart4,
          chartPositive: AppColor.chartPositive,
          chartNegative: AppColor.chartNegative,
        ),
      ],
      brightness: Brightness.light,
      colorScheme: colorScheme,
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.background,
      canvasColor: AppColor.background,
      dividerColor: AppColor.divider,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      disabledColor: AppColor.disabledText,
      cardColor: AppColor.surface,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.surface,
        foregroundColor: AppColor.textPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardTheme(
        color: AppColor.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColor.borderDefault,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColor.divider,
        thickness: 1,
      ),
    );
  }
}
