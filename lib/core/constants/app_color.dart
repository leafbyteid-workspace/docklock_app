import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  // BRAND COLORS
  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF475569);
  static const Color accent = Color(0xFF10B981);
  static const Color background = Color(0xFFF8FAFC);

  // SURFACE COLORS
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF1F5F9);
  static const Color surfaceElevated = Color(0xFFFFFFFF);
  static const Color surfaceOverlay = Color(0xFF0F172A);

  // SEMANTIC COLORS
  static const Color success = Color(0xFF22C55E);
  static const Color info = primary;
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color onSemantic = Colors.white;

  // ON COLORS
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static const Color onAccent = Colors.white;
  static const Color onBackground = Color(0xFF0F172A);

  // TEXT COLORS
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFFCBD5E1);
  static const Color textInverse = Colors.white;
  static const Color textLink = primary;

  // ICON COLORS
  static const Color iconPrimary = textPrimary;
  static const Color iconSecondary = textSecondary;
  static const Color iconDisabled = Color(0xFFCBD5E1);
  static const Color iconInverse = Colors.white;

  // BORDER COLORS
  static const Color borderDefault = Color(0xFFE2E8F0);
  static const Color borderSubtle = Color(0xFFF1F5F9);
  static const Color borderStrong = Color(0xFF94A3B8);
  static const Color borderFocus = primary;

  // DIVIDER
  static const Color divider = borderDefault;
  static const Color separator = borderDefault;

  // DISABLED
  static const Color disabledBackground = Color(0xFFF1F5F9);
  static const Color disabledText = Color(0xFF94A3B8);
  static const Color disabledBorder = Color(0xFFE2E8F0);
  static const Color disabledIcon = Color(0xFFCBD5E1);

  // INVERSE
  static const Color backgroundInverse = Color(0xFF0F172A);
  static const Color surfaceInverse = Color(0xFF1E293B);
  static const Color textInverseColor = Colors.white;

  // OVERLAY
  static const Color overlay = Color(0x660F172A);
  static const Color scrim = Color(0x99000000);
  static const Color backdrop = Color(0xCC000000);

  // NEUTRAL PALETTE
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);

  // INTERACTIVE STATES
  static const Color hover = Color(0xFFEFF6FF);
  static const Color pressed = Color(0xFFDBEAFE);
  static const Color selected = Color(0xFFDBEAFE);
  static const Color focus = Color(0xFFBFDBFE);

  // DATA VISUALIZATION
  static const Color chart1 = primary;
  static const Color chart2 = accent;
  static const Color chart3 = secondary;
  static const Color chart4 = Color(0xFF8B5CF6);
  static const Color chartPositive = success;
  static const Color chartNegative = danger;
}