import 'package:codyad/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
          fontFamily: 'iransans',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'iransans',
              fontSize: 16,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'iransans',
              color: Colors.white,
              fontSize: 13,
            ),
            displaySmall: TextStyle(
              fontFamily: 'iransans',
              color: Colors.white,
              fontSize: 14,
            ),
            displayMedium: TextStyle(
              fontFamily: 'iransans',
              color: Colors.white,
              fontSize: 14,
            ),
            titleSmall: TextStyle(
              fontFamily: 'iransans',
              color: Colors.red,
              fontSize: 14,
            ),
            bodySmall: TextStyle(
              fontFamily: 'iransans',
              color: Colors.green,
              fontSize: 14,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
