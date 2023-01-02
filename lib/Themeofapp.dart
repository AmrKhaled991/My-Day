import 'dart:ui';

import 'package:flutter/material.dart';

class apptheme{
  static Color primarylightcolor=Color(0xff5D9CEC);
  static Color lighthomecolor=Color(0xffDFECDB);
  static Color greencolor=Color(0xff61E757);
 static Color primarydarkcolor=Color(0xff5D9CEC);
  static Color darkhomecolor=Color(0xff060E1E);
  static Color darkitemcolor=Color(0xff141922);
  static ThemeData lightmode=ThemeData(
    primaryColor: primarylightcolor,
    appBarTheme: AppBarTheme(
      color: primarylightcolor
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.white,fontSize: 24),
      headline2: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)
    ),
      scaffoldBackgroundColor: lighthomecolor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      unselectedItemColor: Colors.grey,
        selectedItemColor: primarylightcolor
  )
  );

  static ThemeData darkmode=ThemeData(
    primaryColor: primarydarkcolor,
    appBarTheme: AppBarTheme(
      color: primarydarkcolor
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.black,fontSize: 24),
      headline2: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)
    ),
      canvasColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      unselectedItemColor: Colors.grey,
      selectedItemColor: primarylightcolor
  )
  );

}