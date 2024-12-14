import 'package:flutter/material.dart';
import 'package:synccircle/package_barrel.dart';

TextStyle getArchivo({
  double fontSize = 14,
  Color textcolor = Colors.white,
  FontWeight fontweight = FontWeight.normal,
}) {
  return GoogleFonts.archivo(
    fontSize: fontSize,
    color: textcolor,
    fontWeight: fontweight,
  );
}
