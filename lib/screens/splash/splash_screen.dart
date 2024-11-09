import 'dart:async';

import 'package:codyad/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offNamed(PageRoutes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF282222),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ramzina.png',
              width: 200.w,
              height: 250.h,
            ),
            Text(
              "رمزینا",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'iransans'),
            ),
          ],
        ),
      ),
    );
  }
}
