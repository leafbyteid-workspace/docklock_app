import 'package:flutter/material.dart';

import 'app_theme_extension.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  AppThemeExtension get colors => theme.extension<AppThemeExtension>()!;
}
