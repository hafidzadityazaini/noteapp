import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme baseText = GoogleFonts.poppinsTextTheme();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: Colors.lightBlue,
      secondary: Colors.lightBlueAccent,
      surface: Colors.white10,
    ),
    scaffoldBackgroundColor: const Color(0xffe7e7e7),
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: AppTheme.baseText.titleLarge!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      contentTextStyle: AppTheme.baseText.bodyMedium!.copyWith(
        fontSize: 14,
        color: Colors.black87,
      ),
    ),

    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyMedium: baseText.bodyMedium!.copyWith(
        fontSize: 14,
        color: Colors.black87,
      ),
      bodySmall: baseText.bodySmall!.copyWith(
        fontSize: 12,
        color: Colors.grey,
      ),
    )
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: Colors.grey,
      secondary: Colors.blueGrey,
      surface: Colors.white10,
    ),
    scaffoldBackgroundColor: Colors.black,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: Colors.black,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: AppTheme.baseText.titleLarge!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      contentTextStyle: AppTheme.baseText.bodyMedium!.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
    ),

    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: baseText.bodyMedium!.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: baseText.bodySmall!.copyWith(
        fontSize: 12,
        color: Colors.grey,
      ),
    )
  );
}