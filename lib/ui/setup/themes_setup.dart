import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme() => ThemeData(
        fontFamily: 'Lato',
        brightness: Brightness.dark,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.red[400]),
      );
}
