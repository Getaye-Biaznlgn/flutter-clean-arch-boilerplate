import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    final ThemeData baseTheme = ThemeData.light();

    const Color primaryColor = Colors.blue;
    const Color accentColor = Colors.green;
    const Color scaffoldBackgroundColor = Colors.white;
    const Color appBarColor = Colors.blue;
    const Color appBarTextColor = Colors.white;
    const Color displayTextColor = Colors.grey;
    const Color contextTextColor = Colors.blue;

    final TextStyle labelLargeTextStyle =  TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    final TextStyle bodyLargeTextStyle =  TextStyle(fontSize: 18);
    final TextStyle bodyMediumTextStyle = TextStyle(fontSize: 16);
    final TextStyle bodySmallTextStyle = TextStyle(fontSize: 14);
    final TextStyle titleMediumTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    final TextStyle titleLargeTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    final TextStyle buttonTextStyle = TextStyle(fontSize: 16);
    final TextStyle displaySmallTextStyle = TextStyle(fontSize: 12, color: displayTextColor);
    final TextStyle displayMediumTextStyle = TextStyle(fontSize: 14, color: Colors.black87);
    final TextStyle contextTextStyle = TextStyle(fontSize: 14, color: contextTextColor);

    final ColorScheme colorScheme = ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: scaffoldBackgroundColor,
      background: scaffoldBackgroundColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
    );

    final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final ChipThemeData chipTheme = ChipThemeData(
      backgroundColor: Colors.grey[300],
      brightness: Brightness.light,
      labelStyle: const TextStyle(color: Colors.black87),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );

    return baseTheme.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: appBarColor,
        elevation: 0,
        iconTheme: IconThemeData(color: appBarTextColor),
     
      ),
      textTheme: TextTheme(
        labelLarge: labelLargeTextStyle,
        bodyLarge: bodyLargeTextStyle,
        bodyMedium: bodyMediumTextStyle,
        bodySmall: bodySmallTextStyle,
        titleMedium: titleMediumTextStyle,
        titleLarge: titleLargeTextStyle,
        labelMedium: buttonTextStyle,
        displaySmall: displaySmallTextStyle,
        displayMedium: displayMediumTextStyle,
        labelSmall: contextTextStyle,
      ),
      inputDecorationTheme: inputDecorationTheme,
      chipTheme: chipTheme,
    );
  }
}
