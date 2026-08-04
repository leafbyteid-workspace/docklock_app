import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isMobileMini(BuildContext context) => width(context) < 360;

  static bool isMobile(BuildContext context) =>
      width(context) >= 360 && width(context) < 600;

  static bool isTablet(BuildContext context) =>
      width(context) >= 600 && width(context) < 1024;

  static bool isDesktop(BuildContext context) => width(context) >= 1024;

  static double horizontalPadding(BuildContext context) {
    if (isDesktop(context)) return 72;
    if (isTablet(context)) return 48;
    if (isMobileMini(context)) return 16;
    return 24;
  }

  static double maxContentWidth(BuildContext context) {
    if (isDesktop(context)) return 700;
    if (isTablet(context)) return 600;
    return double.infinity;
  }

  static double logoSize(BuildContext context) {
    if (isDesktop(context)) return 180;
    if (isTablet(context)) return 150;
    if (isMobileMini(context)) return 90;
    return 120;
  }

  static double loadingSize(BuildContext context) {
    if (isTablet(context)) return 56;
    if (isMobileMini(context)) return 40;
    return 48;
  }

  static double titleSize(BuildContext context) {
    if (isDesktop(context)) return 36;
    if (isTablet(context)) return 32;
    if (isMobileMini(context)) return 22;
    return 28;
  }

  static double descriptionSize(BuildContext context) {
    if (isTablet(context)) return 18;
    if (isMobileMini(context)) return 13;
    return 15;
  }

  static double spacing(BuildContext context, double mobile) {
    if (isDesktop(context)) return mobile * 2;
    if (isTablet(context)) return mobile * 1.5;
    if (isMobileMini(context)) return mobile * 0.8;
    return mobile;
  }

  static double formWidth(BuildContext context) {
    if (isDesktop(context)) return 520;
    if (isTablet(context)) return 500;
    return double.infinity;
  }

  static double buttonHeight(BuildContext context) {
    if (isMobileMini(context)) return 44;
    if (isTablet(context)) return 54;
    return 48;
  }

  static double textFieldSpacing(BuildContext context) {
    if (isMobileMini(context)) return 12;
    if (isTablet(context)) return 20;
    return 16;
  }

  static double sectionSpacing(BuildContext context) {
    if (isMobileMini(context)) return 24;
    if (isTablet(context)) return 40;
    return 32;
  }

  static double pageWidth(BuildContext context) {
    if (isDesktop(context)) return 900;
    if (isTablet(context)) return 700;
    return double.infinity;
  }

  static bool useVerticalLayout(BuildContext context) {
    return width(context) < 500;
  }

  static bool useCompactLayout(BuildContext context) {
    return width(context) < 360;
  }

  static int gridColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTablet(context)) return 3;
    return 2;
  }
}
