import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static const String titleText = 'Ortalama Hesapla';
  static final TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle showAvarageBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: mainColor,
  );
  static final TextStyle avarageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );
}
