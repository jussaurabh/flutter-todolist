import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    accentColor: kSecondaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kContentColorLightTheme),
      bodyText2: TextStyle(color: kContentColorLightTheme),
      headline1: TextStyle(color: kContentColorLightTheme),
      headline2: TextStyle(color: kContentColorLightTheme),
      headline3: TextStyle(color: kContentColorLightTheme),
      headline4: TextStyle(color: kContentColorLightTheme),
      headline5: TextStyle(color: kContentColorLightTheme),
      headline6: TextStyle(color: kContentColorLightTheme),
      caption: TextStyle(color: kContentColorLightTheme),
      button: TextStyle(color: kContentColorLightTheme),
      subtitle1: TextStyle(color: kContentColorLightTheme),
      subtitle2: TextStyle(color: kContentColorLightTheme),
    ),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    dividerTheme: DividerThemeData(color: Colors.black12),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    accentColor: kSecondaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      brightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kContentColorDarkTheme),
      bodyText2: TextStyle(color: kContentColorDarkTheme),
      headline1: TextStyle(color: kContentColorDarkTheme),
      headline2: TextStyle(color: kContentColorDarkTheme),
      headline3: TextStyle(color: kContentColorDarkTheme),
      headline4: TextStyle(color: kContentColorDarkTheme),
      headline5: TextStyle(color: kContentColorDarkTheme),
      headline6: TextStyle(color: kContentColorDarkTheme),
      caption: TextStyle(color: kContentColorDarkTheme),
      button: TextStyle(color: kContentColorDarkTheme),
      subtitle1: TextStyle(color: kContentColorDarkTheme),
      subtitle2: TextStyle(color: kContentColorDarkTheme),
    ),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    dividerTheme: DividerThemeData(color: Colors.white10),
  );
}

// final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
