import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme() => ThemeData(
        fontFamily: 'Lato',
        brightness: Brightness.dark,
        accentColor: Colors.red[400],
        // primarySwatch: Colors.blue,
      );
}
