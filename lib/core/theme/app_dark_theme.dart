import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'extensions/app_theme_extension.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static ThemeData get theme {
    const colorScheme = ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColorDark.primary,
      onPrimary: AppColorDark.onPrimary,
      secondary: AppColorDark.accent,
      onSecondary: AppColorDark.onAccent,
      surface: AppColorDark.surface,
      onSurface: AppColorDark.textPrimary,
      error: AppColorDark.danger,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      extensions: const [
        AppThemeExtension(
          background: AppColorDark.background,
          backgroundInverse: AppColorDark.backgroundInverse,
          surface: AppColorDark.surface,
          surfaceVariant: AppColorDark.surfaceVariant,
          surfaceElevated: AppColorDark.surfaceElevated,
          surfaceOverlay: AppColorDark.surfaceOverlay,
          surfaceInverse: AppColorDark.surfaceInverse,
          primary: AppColorDark.primary,
          secondary: AppColorDark.secondary,
          accent: AppColorDark.accent,
          onPrimary: AppColorDark.onPrimary,
          onSecondary: AppColorDark.onSecondary,
          onAccent: AppColorDark.onAccent,
          onBackground: AppColorDark.onBackground,
          success: AppColorDark.success,
          info: AppColorDark.info,
          warning: AppColorDark.warning,
          danger: AppColorDark.danger,
          onSemantic: AppColorDark.onSemantic,
          textPrimary: AppColorDark.textPrimary,
          textSecondary: AppColorDark.textSecondary,
          textTertiary: AppColorDark.textTertiary,
          textMuted: AppColorDark.textMuted,
          textInverse: AppColorDark.textInverse,
          textLink: AppColorDark.textLink,
          iconPrimary: AppColorDark.iconPrimary,
          iconSecondary: AppColorDark.iconSecondary,
          iconDisabled: AppColorDark.iconDisabled,
          iconInverse: AppColorDark.iconInverse,
          borderDefault: AppColorDark.borderDefault,
          borderSubtle: AppColorDark.borderSubtle,
          borderStrong: AppColorDark.borderStrong,
          borderFocus: AppColorDark.borderFocus,
          divider: AppColorDark.divider,
          separator: AppColorDark.separator,
          disabledBackground: AppColorDark.disabledBackground,
          disabledText: AppColorDark.disabledText,
          disabledBorder: AppColorDark.disabledBorder,
          disabledIcon: AppColorDark.disabledIcon,
          overlay: AppColorDark.overlay,
          scrim: AppColorDark.scrim,
          backdrop: AppColorDark.backdrop,
          hover: AppColorDark.hover,
          pressed: AppColorDark.pressed,
          selected: AppColorDark.selected,
          focus: AppColorDark.focus,
          chart1: AppColorDark.chart1,
          chart2: AppColorDark.chart2,
          chart3: AppColorDark.chart3,
          chart4: AppColorDark.chart4,
          chartPositive: AppColorDark.chartPositive,
          chartNegative: AppColorDark.chartNegative,
        ),
      ],
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      primaryColor: AppColorDark.primary,
      scaffoldBackgroundColor: AppColorDark.background,
      canvasColor: AppColorDark.background,
      dividerColor: AppColorDark.divider,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      disabledColor: AppColorDark.disabledText,
      cardColor: AppColorDark.surface,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColorDark.surface,
        foregroundColor: AppColorDark.textPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: AppColorDark.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColorDark.borderDefault,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColorDark.divider,
        thickness: 1,
      ),
    );
  }
}
