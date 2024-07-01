import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.black,
    background: Colors.white,
    outline: Colors.black,
    outlineVariant: Colors.grey.shade400,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.white,
      side: const BorderSide(
        color: Colors.black,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: GoogleFonts.rubik(
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  hoverColor: Colors.lightBlueAccent,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  cardColor: Colors.grey[350],
  textTheme: TextTheme(
    titleLarge: GoogleFonts.rubik(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    labelLarge: GoogleFonts.rubik(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
    titleMedium: GoogleFonts.rubik(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
    labelSmall: GoogleFonts.outfit(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ),
  ),
  useMaterial3: true,
);
