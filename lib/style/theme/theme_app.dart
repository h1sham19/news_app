import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static Color primary = const Color(0xff30b753);
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white12,
          statusBarIconBrightness: Brightness.dark,
        ),
        color: primary,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 2),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.black,
      backgroundColor: const Color(0xa3fffefe),
      selectedItemColor: primary,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 25.0,
      type: BottomNavigationBarType.fixed,
    ),
    splashColor: primary,
    textTheme: const TextTheme(
      headline1:  TextStyle(fontSize: 15, fontWeight: FontWeight.w800,color: Colors.black),
      headline2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xffA3A3A3))
    )
  );
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.black87,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black54,
            statusBarIconBrightness: Brightness.light,
          ),
          color: Color(0xBB42772E),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 2),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black87,
        selectedItemColor: Color(0xBB42772E),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 25.0,
        type: BottomNavigationBarType.fixed,
      ),
      splashColor: Color(0xBB42772E),
      textTheme: const TextTheme(
          headline1:  TextStyle(fontSize: 15, fontWeight: FontWeight.w800,color: Colors.white),
          headline2: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xffA3A3A3))
      )
  );
}
