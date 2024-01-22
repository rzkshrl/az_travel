// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

Color light = HexColor('#FFFFFF');
Color dark = HexColor('#121212');
Color black = HexColor('#000000');

Color blue_0C134F = HexColor('#0C134F');
Color yellow1_F9B401 = HexColor('#F9B401');

class AZTravelTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: light,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: light,
      iconTheme: IconThemeData(color: dark),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
    ),
  );
}
