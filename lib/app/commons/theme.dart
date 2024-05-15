import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme _customLightThemesTextTheme(TextTheme base) {
  return base.copyWith(
    displayLarge: GoogleFonts.lato(
      fontWeight: FontWeight.w400,
      color: const Color(0xFF1C1F25),
    ),
    displaySmall: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    headlineMedium: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      color: const Color(0xFF3D4046),
    ),
    bodySmall: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    bodyLarge: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    bodyMedium: GoogleFonts.lato(
      color: const Color(0xFF3D4046),
    ),
    displayMedium: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    headlineSmall: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    titleMedium: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    titleSmall: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    labelLarge: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
    labelSmall: GoogleFonts.lato(
      color: const Color(0xFF1C1F25),
    ),
  );
}

var colorSchemeTheme = const ColorScheme(
  primary: Color(0xFF182842),
  onPrimary: Color(0xFF1B1A15),
  primaryContainer: Color(0xFF182842),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFFFFFFFF),
  secondary: Color(0xFFa8934a),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF0C0C0C),
  error: Color(0xFFDB3030),
  onError: Color(0xFFFFFFFF),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF1C1F25),
  brightness: Brightness.light,
);
ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    colorScheme: colorSchemeTheme,
    textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
    primaryColor: const Color(0xFF182842),
    indicatorColor: const Color(0xFF0C0C0C),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: const Color(0xFF1C1F25),
      size: 20,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: const Color(0xFF1C1F25),
    ),
    cardColor: const Color(0xFFececec),
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      labelColor: const Color(0xFF182842),
      unselectedLabelColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF182842),
          foregroundColor: Colors.white,
          minimumSize: const Size(150, 40),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textStyle: _customLightThemesTextTheme(lightTheme.textTheme)
              .labelLarge!
              .copyWith(letterSpacing: 1.5)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF182842),
          minimumSize: const Size(150, 40),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          side: const BorderSide(color: Color(0xFF182842)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textStyle:
              _customLightThemesTextTheme(lightTheme.textTheme).labelLarge),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(Color(0xFF182842)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
  );
}
