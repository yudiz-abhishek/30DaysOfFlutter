import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  //Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      //Auto Switch Colors using dart collections
      primarySwatch: Colors.deepPurple,
      //For Allover App Font
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          //For App Bar Title text
          titleTextStyle: Theme.of(context).textTheme.headline6));

  //Dark Theme
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
