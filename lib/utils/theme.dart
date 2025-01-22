import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 57, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    displayMedium: TextStyle(
        fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    displaySmall: TextStyle(
        fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    headlineLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
    headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
    titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
    titleMedium: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
    titleSmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
    labelMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    labelSmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
  ),
  colorScheme: darkScheme(),
  primaryColor: Color(0xff38B990),
);

ColorScheme darkScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff38B990),
    surfaceTint: Color(0xff80d5d4),
    onPrimary: Color(0xffbdbdbd),
    primaryContainer: Color(0xff121212),
    onPrimaryContainer: Color(0xff9cf1f0),
    secondary: Color(0xffb0cccb),
    onSecondary: Color(0xff1b3534),
    secondaryContainer: Color(0xff324b4b),
    onSecondaryContainer: Color(0xffcce8e7),
    tertiary: Color(0xffb3c8e8),
    onTertiary: Color(0xff1c314b),
    tertiaryContainer: Color(0xff334863),
    onTertiaryContainer: Color(0xffd3e4ff),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff060606),
    onSurface: Color(0xffbdbdbd),
    onSurfaceVariant: Color(0xffbec9c8),
    outline: Color(0xff889392),
    outlineVariant: Color(0xff3f4948),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdde4e3),
    inversePrimary: Color(0xff006a6a),
    primaryFixed: Color(0xff9cf1f0),
    onPrimaryFixed: Color(0xff002020),
    primaryFixedDim: Color(0xff80d5d4),
    onPrimaryFixedVariant: Color(0xff004f50),
    secondaryFixed: Color(0xffcce8e7),
    onSecondaryFixed: Color(0xff051f1f),
    secondaryFixedDim: Color(0xffb0cccb),
    onSecondaryFixedVariant: Color(0xff324b4b),
    tertiaryFixed: Color(0xffd3e4ff),
    onTertiaryFixed: Color(0xff041c35),
    tertiaryFixedDim: Color(0xffb3c8e8),
    onTertiaryFixedVariant: Color(0xff334863),
    surfaceDim: Color(0xff0e1514),
    surfaceBright: Color(0xff343a3a),
    surfaceContainerLowest: Color(0xff090f0f),
    surfaceContainerLow: Color(0xff161d1d),
    surfaceContainer: Color(0xff1a2121),
    surfaceContainerHigh: Color(0xff252b2b),
    surfaceContainerHighest: Color(0xff2f3636),
  );
}
