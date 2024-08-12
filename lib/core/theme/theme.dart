import 'package:flutter/material.dart';
import 'package:flutter_clean/core/theme/app_palette.dart';

class AppTheme {

  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
            borderSide: BorderSide(color: color,
            width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
            );

  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(27),
        enabledBorder: _border(),
            focusedBorder: _border(AppPalette.gradient1),
      ));
}
