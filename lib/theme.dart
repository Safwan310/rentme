import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary_color = Color(0xff2377f4);
const secondary_color = Color(0xffff6524);
const field_color = Color(0xffE5E5E5);

ThemeData theme(){
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
      ),
      primaryColor: primary_color,

      scaffoldBackgroundColor: primary_color,
      textTheme: texttheme(),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: primary_color,
        cursorColor: primary_color,

      ),
      buttonColor: secondary_color,
      buttonTheme: ButtonThemeData(
        buttonColor: secondary_color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      )
  );
}
TextTheme texttheme()
{
  return TextTheme(
    headline1: GoogleFonts.lato(
      fontSize:30,
      fontWeight: FontWeight.w700,
    ),
    button: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),

  );
}
