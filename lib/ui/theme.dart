import 'package:ceb/ui/colors.dart';
import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData();

  return baseTheme.copyWith(
    primaryIconTheme: IconThemeData(color: primaryDark),
    primaryColor: primaryColor,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    accentColor: secondaryColor,
//      primaryIconTheme:primaryDark,
  );
}
