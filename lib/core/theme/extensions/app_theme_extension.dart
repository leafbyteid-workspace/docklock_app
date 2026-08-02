import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    // Background
    required this.background,
    required this.backgroundInverse,

    // Surface
    required this.surface,
    required this.surfaceVariant,
    required this.surfaceElevated,
    required this.surfaceOverlay,
    required this.surfaceInverse,

    // Brand
    required this.primary,
    required this.secondary,
    required this.accent,

    // On Color
    required this.onPrimary,
    required this.onSecondary,
    required this.onAccent,
    required this.onBackground,

    // Semantic
    required this.success,
    required this.info,
    required this.warning,
    required this.danger,
    required this.onSemantic,

    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textInverse,
    required this.textLink,

    // Icon
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconDisabled,
    required this.iconInverse,

    // Border
    required this.borderDefault,
    required this.borderSubtle,
    required this.borderStrong,
    required this.borderFocus,

    // Divider
    required this.divider,
    required this.separator,

    // Disabled
    required this.disabledBackground,
    required this.disabledText,
    required this.disabledBorder,
    required this.disabledIcon,

    // Overlay
    required this.overlay,
    required this.scrim,
    required this.backdrop,

    // Interactive
    required this.hover,
    required this.pressed,
    required this.selected,
    required this.focus,

    // Chart
    required this.chart1,
    required this.chart2,
    required this.chart3,
    required this.chart4,
    required this.chartPositive,
    required this.chartNegative,
  });

  // Background
  final Color background;
  final Color backgroundInverse;

  // Surface
  final Color surface;
  final Color surfaceVariant;
  final Color surfaceElevated;
  final Color surfaceOverlay;
  final Color surfaceInverse;

  // Brand
  final Color primary;
  final Color secondary;
  final Color accent;

  // On
  final Color onPrimary;
  final Color onSecondary;
  final Color onAccent;
  final Color onBackground;

  // Semantic
  final Color success;
  final Color info;
  final Color warning;
  final Color danger;
  final Color onSemantic;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color textInverse;
  final Color textLink;

  // Icon
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconDisabled;
  final Color iconInverse;

  // Border
  final Color borderDefault;
  final Color borderSubtle;
  final Color borderStrong;
  final Color borderFocus;

  // Divider
  final Color divider;
  final Color separator;

  // Disabled
  final Color disabledBackground;
  final Color disabledText;
  final Color disabledBorder;
  final Color disabledIcon;

  // Overlay
  final Color overlay;
  final Color scrim;
  final Color backdrop;

  // Interactive
  final Color hover;
  final Color pressed;
  final Color selected;
  final Color focus;

  // Chart
  final Color chart1;
  final Color chart2;
  final Color chart3;
  final Color chart4;
  final Color chartPositive;
  final Color chartNegative;

  @override
  AppThemeExtension copyWith({
    Color? background,
    Color? backgroundInverse,
    Color? surface,
    Color? surfaceVariant,
    Color? surfaceElevated,
    Color? surfaceOverlay,
    Color? surfaceInverse,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? onPrimary,
    Color? onSecondary,
    Color? onAccent,
    Color? onBackground,
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
    Color? onSemantic,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textMuted,
    Color? textInverse,
    Color? textLink,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconDisabled,
    Color? iconInverse,
    Color? borderDefault,
    Color? borderSubtle,
    Color? borderStrong,
    Color? borderFocus,
    Color? divider,
    Color? separator,
    Color? disabledBackground,
    Color? disabledText,
    Color? disabledBorder,
    Color? disabledIcon,
    Color? overlay,
    Color? scrim,
    Color? backdrop,
    Color? hover,
    Color? pressed,
    Color? selected,
    Color? focus,
    Color? chart1,
    Color? chart2,
    Color? chart3,
    Color? chart4,
    Color? chartPositive,
    Color? chartNegative,
  }) {
    return AppThemeExtension(
      background: background ?? this.background,
      backgroundInverse: backgroundInverse ?? this.backgroundInverse,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      surfaceOverlay: surfaceOverlay ?? this.surfaceOverlay,
      surfaceInverse: surfaceInverse ?? this.surfaceInverse,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onAccent: onAccent ?? this.onAccent,
      onBackground: onBackground ?? this.onBackground,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      onSemantic: onSemantic ?? this.onSemantic,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textMuted: textMuted ?? this.textMuted,
      textInverse: textInverse ?? this.textInverse,
      textLink: textLink ?? this.textLink,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconDisabled: iconDisabled ?? this.iconDisabled,
      iconInverse: iconInverse ?? this.iconInverse,
      borderDefault: borderDefault ?? this.borderDefault,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderStrong: borderStrong ?? this.borderStrong,
      borderFocus: borderFocus ?? this.borderFocus,
      divider: divider ?? this.divider,
      separator: separator ?? this.separator,
      disabledBackground: disabledBackground ?? this.disabledBackground,
      disabledText: disabledText ?? this.disabledText,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      disabledIcon: disabledIcon ?? this.disabledIcon,
      overlay: overlay ?? this.overlay,
      scrim: scrim ?? this.scrim,
      backdrop: backdrop ?? this.backdrop,
      hover: hover ?? this.hover,
      pressed: pressed ?? this.pressed,
      selected: selected ?? this.selected,
      focus: focus ?? this.focus,
      chart1: chart1 ?? this.chart1,
      chart2: chart2 ?? this.chart2,
      chart3: chart3 ?? this.chart3,
      chart4: chart4 ?? this.chart4,
      chartPositive: chartPositive ?? this.chartPositive,
      chartNegative: chartNegative ?? this.chartNegative,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;

    Color l(Color a, Color b) => Color.lerp(a, b, t)!;

    return AppThemeExtension(
      background: l(background, other.background),
      backgroundInverse: l(backgroundInverse, other.backgroundInverse),
      surface: l(surface, other.surface),
      surfaceVariant: l(surfaceVariant, other.surfaceVariant),
      surfaceElevated: l(surfaceElevated, other.surfaceElevated),
      surfaceOverlay: l(surfaceOverlay, other.surfaceOverlay),
      surfaceInverse: l(surfaceInverse, other.surfaceInverse),
      primary: l(primary, other.primary),
      secondary: l(secondary, other.secondary),
      accent: l(accent, other.accent),
      onPrimary: l(onPrimary, other.onPrimary),
      onSecondary: l(onSecondary, other.onSecondary),
      onAccent: l(onAccent, other.onAccent),
      onBackground: l(onBackground, other.onBackground),
      success: l(success, other.success),
      info: l(info, other.info),
      warning: l(warning, other.warning),
      danger: l(danger, other.danger),
      onSemantic: l(onSemantic, other.onSemantic),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textTertiary: l(textTertiary, other.textTertiary),
      textMuted: l(textMuted, other.textMuted),
      textInverse: l(textInverse, other.textInverse),
      textLink: l(textLink, other.textLink),
      iconPrimary: l(iconPrimary, other.iconPrimary),
      iconSecondary: l(iconSecondary, other.iconSecondary),
      iconDisabled: l(iconDisabled, other.iconDisabled),
      iconInverse: l(iconInverse, other.iconInverse),
      borderDefault: l(borderDefault, other.borderDefault),
      borderSubtle: l(borderSubtle, other.borderSubtle),
      borderStrong: l(borderStrong, other.borderStrong),
      borderFocus: l(borderFocus, other.borderFocus),
      divider: l(divider, other.divider),
      separator: l(separator, other.separator),
      disabledBackground: l(disabledBackground, other.disabledBackground),
      disabledText: l(disabledText, other.disabledText),
      disabledBorder: l(disabledBorder, other.disabledBorder),
      disabledIcon: l(disabledIcon, other.disabledIcon),
      overlay: l(overlay, other.overlay),
      scrim: l(scrim, other.scrim),
      backdrop: l(backdrop, other.backdrop),
      hover: l(hover, other.hover),
      pressed: l(pressed, other.pressed),
      selected: l(selected, other.selected),
      focus: l(focus, other.focus),
      chart1: l(chart1, other.chart1),
      chart2: l(chart2, other.chart2),
      chart3: l(chart3, other.chart3),
      chart4: l(chart4, other.chart4),
      chartPositive: l(chartPositive, other.chartPositive),
      chartNegative: l(chartNegative, other.chartNegative),
    );
  }
}
