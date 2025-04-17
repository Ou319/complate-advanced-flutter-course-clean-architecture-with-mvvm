import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// this style for title
TextStyle getTextStyleTitle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.inder(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// this for suptitle
TextStyle getTextStylesubetitle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
// this for long text
TextStyle getTextStylelongtext(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.siemreap(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
