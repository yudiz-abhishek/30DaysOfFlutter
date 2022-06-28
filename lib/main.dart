import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Abhishek";
    double pi = 3.14;
    bool isMale = true;
    //We can use int, double in num
    num temp = 30;
    num temp1 = 30.5;
    //var any value
    var day = "Monday";
    //For Constant
    const piConst = 3.14;
    //Final and const => In final we can add while list but in const we can't add

    return MaterialApp(
      //Set Dark and Light Theme
      themeMode: ThemeMode.light,
      //For Light Theme Colors
      theme: ThemeData(
          //Auto Switch Colors using dart collections
          primarySwatch: Colors.deepPurple,
          //For Allover App Font
          fontFamily: GoogleFonts.lato().fontFamily),
      //For Dark Theme Colors
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
