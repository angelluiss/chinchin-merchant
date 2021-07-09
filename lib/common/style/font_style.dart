import 'package:flutter/material.dart';

class AppFont extends Color {
  AppFont(int value) : super(value);
  static const _fontFamilyPrincipal = 'JLSDataGothic-CNC';

  static TextStyle customStyle({double? size, Color color = Colors.white}) {
    return TextStyle(
        fontSize: size, color: color, fontFamily: _fontFamilyPrincipal);
  }

  static TextStyle customStyleBold({double? size, Color color = Colors.white}) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontFamily: _fontFamilyPrincipal,
        fontWeight: FontWeight.bold);
  }
}
