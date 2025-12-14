import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppColors {
  static Color primaryColor = Color.fromRGBO(162, 29, 19, 1.0);
  static Color primaryAccent = Color.fromRGBO(136, 37, 30, 1.0);
  static Color secondaryColor = Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);
  static Color textColor = Color.fromRGBO(150, 150, 150, 1);
  static Color titleColor = Color.fromRGBO(200, 200, 200, 1);
  static Color successColor = Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = Color.fromRGBO(212, 172, 13, 1);
}


ThemeData primaryTheme = ThemeData(

  colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
  ),

  scaffoldBackgroundColor: AppColors.secondaryAccent,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
  ),


  textTheme: TextTheme(

    titleMedium: TextStyle(
      fontSize: 24.0,
      letterSpacing: 1,
      color: AppColors.titleColor,
      fontWeight: FontWeight.bold,
    ),

    headlineMedium: TextStyle(
      fontSize: 20.0,
      letterSpacing: 1,
      color: AppColors.titleColor,
      fontWeight: FontWeight.bold,
    ),

    bodyMedium: TextStyle(
      fontSize: 22.0,
      letterSpacing: 1,
      color: AppColors.textColor,
    ),

  ),

  cardTheme: CardThemeData(
    surfaceTintColor: Colors.transparent,
    color: AppColors.secondaryColor.withOpacity(1),
    margin: EdgeInsets.only(bottom: 15),
    elevation: 24, // increase for stronger shadow
    shadowColor: Colors.black.withOpacity(1),
    shape: RoundedRectangleBorder(),
  ),


  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor,
    border: InputBorder.none,
    labelStyle: GoogleFonts.kanit(
      textStyle: TextStyle(color: AppColors.textColor),
    ),
    prefixIconColor: AppColors.primaryAccent,
    contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
  ),


  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.secondaryAccent,
    surfaceTintColor: Colors.transparent,
  ),

);