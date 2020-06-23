import 'package:flutter/material.dart';

enum Themes {
  darkTheme,
  brightTheme,
}
final appThemesData = {
  Themes.darkTheme: ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
        headline1: TextStyle(
          color: const Color(0xffffffff),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      color: Colors.transparent,
      elevation: 0,
    ),
    dividerColor: Color(0xff28274f),
    scaffoldBackgroundColor: Color(0xff11103a),
    accentColor: Color(0xff1e1d45),
    fontFamily: 'Segoe UI',
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: const Color(0xffffffff),
      ),
      headline2: TextStyle(
        fontSize: 88,
        color: const Color(0xffffffff),
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        color: const Color(0xffffffff),
        fontWeight: FontWeight.w300,
      ),
    ),
  ),
  Themes.brightTheme: ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      color: Colors.transparent,
      elevation: 0,
    ),
    dividerColor: Color(0xff00ADFF),
    scaffoldBackgroundColor: Color(0xff27B9FF),
    accentColor: Color(0xff4BC5FF),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 88,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
    ),
  ),
};
