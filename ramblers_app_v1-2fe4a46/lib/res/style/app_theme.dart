import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_palette.dart';
import 'font_palette.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
      fontFamily: FontPalette.themeFont,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorPalette.primaryColor;
              } else if (states.contains(MaterialState.disabled)) {
                return ColorPalette.primaryColor;
              }
              return ColorPalette.primaryColor;
            },
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: ColorPalette.bgColor,
          iconTheme: const IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorPalette.bgColor,
              statusBarBrightness:
                  Platform.isIOS ? Brightness.light : Brightness.dark)),
      useMaterial3: true,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: ColorPalette.materialPrimary)
              .copyWith(background: Colors.white));
}
