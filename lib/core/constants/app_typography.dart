import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Inter';

  // FONT WEIGHT HELPERS
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // DISPLAY
  static TextStyle displayLarge({
    FontWeight fontWeight = bold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      height: 48 / 40,
      letterSpacing: -0.5,
      fontWeight: fontWeight,
    );
  }

  static TextStyle displayMedium({
    FontWeight fontWeight = bold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 34,
      height: 41 / 34,
      letterSpacing: -0.4,
      fontWeight: fontWeight,
    );
  }

  static TextStyle displaySmall({
    FontWeight fontWeight = semiBold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 30,
      height: 36 / 30,
      letterSpacing: -0.3,
      fontWeight: fontWeight,
    );
  }

  // LARGE TITLE
  static TextStyle largeTitle({
    FontWeight fontWeight = semiBold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 34,
      height: 41 / 34,
      letterSpacing: -0.45,
      fontWeight: fontWeight,
    );
  }

  // TITLES
  static TextStyle title1({
    FontWeight fontWeight = semiBold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      height: 34 / 28,
      letterSpacing: -0.35,
      fontWeight: fontWeight,
    );
  }

  static TextStyle title2({
    FontWeight fontWeight = semiBold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: -0.25,
      fontWeight: fontWeight,
    );
  }

  static TextStyle title3({
    FontWeight fontWeight = semiBold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      height: 25 / 20,
      letterSpacing: -0.20,
      fontWeight: fontWeight,
    );
  }

  // HEADLINE
  static TextStyle headline({
    FontWeight fontWeight = medium,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 17,
      height: 22 / 17,
      letterSpacing: -0.15,
      fontWeight: fontWeight,
    );
  }

  // BODY
  static TextStyle bodyLarge({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      height: 26 / 18,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  static TextStyle bodyPrimary({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  static TextStyle bodySmall({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 22 / 14,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  // CALLOUT
  static TextStyle callout({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  // SUBHEAD
  static TextStyle subhead({
    FontWeight fontWeight = medium,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  // FOOTNOTE
  static TextStyle footnote({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.05,
      fontWeight: fontWeight,
    );
  }

  // CAPTION 1
  static TextStyle caption1({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      height: 14 / 10,
      letterSpacing: 0.10,
      fontWeight: fontWeight,
    );
  }

  // CAPTION 2
  static TextStyle caption2({
    FontWeight fontWeight = medium,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 9,
      height: 12 / 9,
      letterSpacing: 0.15,
      fontWeight: fontWeight,
    );
  }

  // NAV TITLE
  static TextStyle navTitle({
    FontWeight fontWeight = semiBold,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      height: 24 / 18,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  // TAB LABEL
  static TextStyle tabLabel({
    FontWeight fontWeight = medium,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  // MENU ITEM
  static TextStyle menuItem({
    FontWeight fontWeight = regular,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      height: 22 / 16,
      letterSpacing: 0,
      fontWeight: fontWeight,
    );
  }

  // BUTTONS
  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 20 / 15,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle buttonSecondary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 18 / 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // CHIP & BADGE
  static const TextStyle chip = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    height: 18 / 13,
    letterSpacing: 0.10,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle badge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 14 / 11,
    letterSpacing: 0.10,
    fontWeight: FontWeight.bold,
  );

  // NUMERIC
  static const TextStyle numericXL = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    letterSpacing: 0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle numericLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle numericMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // TABLE & SYSTEM
  static const TextStyle tableText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle toast = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle error = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle helper = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  // SYSTEM ALERT
  static const TextStyle systemAlertTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 22 / 17,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle systemAlertBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
}
