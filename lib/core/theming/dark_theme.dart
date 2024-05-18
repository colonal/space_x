import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/font_weight.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,

    // main colors
    brightness: Brightness.dark,
    primaryColor: ColorsManager.mainBlue,
    primaryColorLight: ColorsManager.white,

    primaryColorDark: ColorsManager.black,
    secondaryHeaderColor: ColorsManager.white,
    scaffoldBackgroundColor: ColorsManager.black,

    disabledColor: ColorsManager.disabledColor,
    hintColor: ColorsManager.gray,
    splashColor: ColorsManager.white, // ripple effect color
    dividerColor: ColorsManager.disabledColor,

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorsManager.mainBlue,
      refreshBackgroundColor: Colors.transparent,
    ),

    // icon color
    iconTheme: const IconThemeData(
      color: ColorsManager.gray,
      size: 20,
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: ColorsManager.black,
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorsManager.black.withOpacity(.4),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeightHelper.medium,
        color: ColorsManager.white,
        fontFamily: FontsManager.robotoCondensed,
      ),
    ),

    //  button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorsManager.white,
      disabledColor: ColorsManager.gray,
      splashColor: ColorsManager.mainBlue,
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(140, 48),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeightHelper.bold,
          color: ColorsManager.black,
          fontFamily: FontsManager.robotoCondensed,
        ),
        backgroundColor: ColorsManager.white,
        foregroundColor: ColorsManager.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    // text Style
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeightHelper.bold,
        color: ColorsManager.white,
        fontFamily: FontsManager.robotoCondensed,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeightHelper.medium,
        color: ColorsManager.mainBlue,
        fontFamily: FontsManager.robotoCondensed,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeightHelper.bold,
        color: ColorsManager.gray,
        fontFamily: FontsManager.robotoCondensed,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeightHelper.bold,
        color: ColorsManager.black,
        fontFamily: FontsManager.robotoCondensed,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.white,
        fontFamily: FontsManager.roboto,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeightHelper.bold,
        color: ColorsManager.mainBlue,
        fontFamily: FontsManager.robotoCondensed,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeightHelper.bold,
        color: ColorsManager.white,
        fontFamily: FontsManager.robotoCondensed,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeightHelper.light,
        color: ColorsManager.white,
        fontFamily: FontsManager.roboto,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeightHelper.medium,
        color: ColorsManager.white,
        fontFamily: FontsManager.robotoCondensed,
      ),
      bodyLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeightHelper.light,
        color: ColorsManager.white,
        fontFamily: FontsManager.robotoCondensed,
      ),
    ),
  );
}
