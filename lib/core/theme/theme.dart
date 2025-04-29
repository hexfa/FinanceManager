import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: const AppBarTheme(
    color: card,
    foregroundColor: onPrimaryColor,
    elevation: 0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    backgroundColor: primaryColor,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: card,
    textStyle: GoogleFonts.roboto(color: onCard),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    surface: card,
    onSurface: onCard,
    background: backgroundColor,
    onBackground: onBackground,
    error: error,
    onError: onError,
    brightness: Brightness.light,
  ),
  // textTheme: TextTheme(
  //   bodyLarge: GoogleFonts.roboto(color: onBackground),
  //   bodyMedium: GoogleFonts.roboto(color: onBackground),
  //   bodySmall: GoogleFonts.roboto(color: onBackground),
  //   titleLarge: GoogleFonts.roboto(color: onBackground),
  //   titleMedium: GoogleFonts.roboto(color: onBackground),
  //   titleSmall: GoogleFonts.roboto(color: onBackground),
  // ),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: darkBackgroundColor,
  appBarTheme: const AppBarTheme(
    color: darkCard,
    foregroundColor: darkOnPrimaryColor,
    elevation: 0.5,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    backgroundColor: darkPrimaryColor,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: darkCard,
    textStyle: GoogleFonts.roboto(color: darkOnCard),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: darkPrimaryColor,
    onPrimary: darkOnPrimaryColor,
    secondary: darkSecondaryColor,
    onSecondary: darkOnSecondaryColor,
    surface: darkBackgroundColor,
    onSurface: darkOnBackground,
    background: darkBackgroundColor,
    onBackground: darkOnBackground,
    error: darkError,
    onError: darkOnError,
    brightness: Brightness.dark,
  ),
  // textTheme: TextTheme(
  //   bodyLarge: GoogleFonts.roboto(color: darkOnBackground),
  //   bodyMedium: GoogleFonts.roboto(color: darkOnBackground),
  //   bodySmall: GoogleFonts.roboto(color: darkOnBackground),
  //   titleLarge: GoogleFonts.roboto(color: darkOnBackground),
  //   titleMedium: GoogleFonts.roboto(color: darkOnBackground),
  //   titleSmall: GoogleFonts.roboto(color: darkOnBackground),
  // ),
);
