import 'package:flutter/material.dart';

import 'extensions/app_theme_extension.dart';

extension ThemeHelper on BuildContext {
  
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>()!;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get text => Theme.of(this).textTheme;
}