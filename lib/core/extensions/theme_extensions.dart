import 'package:flutter/material.dart';

/// Provides convenient access to various pre-defined text styles
/// based on font size, color, and weight combinations for a Flutter app.
/// The colors mentioned are the main theme.
extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
}
