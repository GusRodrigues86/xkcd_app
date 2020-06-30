import 'package:flutter/material.dart';
import '../constants/constants.dart';

ThemeData xkcdTheme() => ThemeData(
      primaryColor: PrimaryColor,
      accentColor: AccentColor,
      typography: Typography.material2018(),
      accentColorBrightness: Brightness.light,
      primaryColorBrightness: Brightness.light,
      appBarTheme: _appBarTheme(),
      textTheme: TextTheme().copyWith(
        headline6: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
      ),
    );

AppBarTheme _appBarTheme() => AppBarTheme(
      color: PrimaryColor,
      elevation: 3,
      brightness: Brightness.dark,
    );
