import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        fontFamily: Font.nunito,
        canvasColor: Colors.white,
        // primarySwatch: Colors.indigo,
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  // static ThemeData get light => ThemeData();
  // static ThemeData get dark => ThemeData();
}
