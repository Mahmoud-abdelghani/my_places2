import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(
      0xffF8FAFC,
    ), // Slate 50 (خلفية فاتحة ومريحة)
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, // خلفية أبيض صريح للـ AppBar
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color(0xff0F172A),
      ), // أوف وايت/كحلي غامق للأيقونات
      titleTextStyle: TextStyle(
        color: Color(0xff0F172A),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColor: const Color(
      0xff0D9488,
    ), // Teal 600 (أغمق قليلاً من Dark ليكون أوضح على الخلفية الفاتحة)
    secondaryHeaderColor: const Color(
      0xffF1F5F9,
    ), // Slate 100 (خلفية خفيفة للعناصر الثانوية)
    primaryColorDark: const Color(
      0xff0F172A,
    ), // Slate 900 (للنصوص والأيقونات الأساسية الداكنة)
    primaryColorLight: Colors.white, // للعناصر الفاتحة
    cardColor: Colors.white, // كروت بيضاء للتباين مع الخلفية
    dividerColor: const Color(0xffE2E8F0), // Slate 200 (فاصل ناعم وفاتح)
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff0F172A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1E293B),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColor: const Color(0xff14B8A6), // Teal 500
    secondaryHeaderColor: const Color(
      0x4D1E293B,
    ), // Slate 800 with transparency
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.black,
    cardColor: const Color(0xff1E293B),
    dividerColor: const Color(0xff334155),
  );
}
