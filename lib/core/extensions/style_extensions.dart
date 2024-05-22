import 'package:flutter/material.dart';

/// Provides convenient access to various pre-defined text styles
/// based on font size, color, and weight combinations for a Flutter app.
/// The colors mentioned are the main theme.
extension Style on BuildContext {
  TextStyle? get font18WhiteBold => Theme.of(this).textTheme.titleLarge;
  TextStyle? get font12BlueMedium => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get font12WhiteLight => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get font14BlueBold => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get font16BlackBold => Theme.of(this).textTheme.displayMedium;
  TextStyle? get font16WhiteRegular => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get font12BlueBold => Theme.of(this).textTheme.displaySmall;
  TextStyle? get font24WhiteBold => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get font14WhiteLight => Theme.of(this).textTheme.bodySmall;
  TextStyle? get font20WhiteMedium => Theme.of(this).textTheme.labelLarge;
}
