import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_places/core/app_theme.dart';

import 'package:my_places/core/sqlite_helper.dart';
import 'package:my_places/l10n/app_localizations.dart';

import 'package:my_places/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqliteHelper.initialize();
  runApp(MyApp());
}

ThemeMode themeMode = ThemeMode.dark;
Locale locale = Locale('en');

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      locale: locale,
      supportedLocales: [Locale('en'), Locale('ar')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomeScreen(
        onSelected: (p0) {
          if (p0 != null) {
            setState(() {
              locale = Locale(p0);
            });
          }
        },
        toggleTheme: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}
