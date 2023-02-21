import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 5,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: AppColors.grey),
    backgroundColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.kPrimaryColor,
    ),
  );
}
