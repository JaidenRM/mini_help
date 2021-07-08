import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData defaultTheme = ThemeData(
  primaryColor: Colors.lightBlue[200],
  scaffoldBackgroundColor: Colors.lightBlue[50],
  fontFamily: GoogleFonts.poppins().fontFamily,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      backgroundColor: Colors.blueGrey,
      primary: Colors.lightBlue[50],
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 36.0),
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    buttonColor: Colors.blueGrey,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    subtitle1: TextStyle(fontSize: 20.0),
    subtitle2: TextStyle(fontSize: 18.0),
    bodyText2: TextStyle(fontSize: 18.0),
    button: TextStyle(fontSize: 18.0),
  ),
);
