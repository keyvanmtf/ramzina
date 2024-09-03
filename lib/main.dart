import 'package:codyad/common/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: PageRoutes.routes,
      initialRoute: PageRoutes.SPLASH,
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('en', 'US'),
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
    );
  }
}
