import 'package:flutter/material.dart';
import 'package:sillicont_tv/config/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData (
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,
    fontFamily: 'Google Sans Flex',
    iconTheme: IconThemeData(color: AppColors.primary),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(

      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontFamily: 'Google Sans Flex',
        fontWeight: FontWeight(500)
      ),

      headlineMedium: TextStyle(
        color: AppColors.black,
        fontSize: 27,
        fontFamily: 'Google Sans Flex',
        fontWeight: FontWeight(600),
      ),

      headlineSmall: TextStyle(
        color: AppColors.black,
        fontSize: 25,
        fontFamily: 'Google Sans Flex',
        fontWeight: FontWeight(500),
      ),

    ),

    cardTheme: CardThemeData(
      color: AppColors.secondary,
      elevation: 1,
      clipBehavior: .hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    )
  );
}