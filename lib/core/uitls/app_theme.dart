import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.robotoMono().fontFamily,
    primaryColor: AppColors.green,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        elevation: 5,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.grey),
    backgroundColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.green,
    ),
  );
}
