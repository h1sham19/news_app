import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static Color pramiry = const Color(0xff30b753);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white12,
          statusBarIconBrightness: Brightness.dark,
        ),
        color: pramiry,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 2),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.black,
      backgroundColor: const Color(0xa3fffefe),
      selectedItemColor: pramiry,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 25.0,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
