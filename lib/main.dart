import 'package:codyad/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            getPages: PageRoutes.routes,
            initialRoute: PageRoutes.SPLASH,
            locale: const Locale('fa', 'IR'),
            fallbackLocale: const Locale('en', 'US'),
            theme: ThemeData(
                fontFamily: 'iransans',
                textTheme: TextTheme(
                  displayLarge: TextStyle(
                    fontFamily: 'iransans',
                    fontSize: 16.sp,
                  ),
                  bodyMedium: TextStyle(
                    fontFamily: 'iransans',
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                  displaySmall: TextStyle(
                    fontFamily: 'iransans',
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  displayMedium: TextStyle(
                    fontFamily: 'iransans',
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  titleSmall: TextStyle(
                    fontFamily: 'iransans',
                    color: Colors.red,
                    fontSize: 14.sp,
                  ),
                  bodySmall: TextStyle(
                    fontFamily: 'iransans',
                    color: Colors.green,
                    fontSize: 14.sp,
                  ),
                )),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
