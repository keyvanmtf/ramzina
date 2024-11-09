import 'package:codyad/screens/home/home.dart';
import 'package:codyad/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class PageRoutes {
  static const SPLASH = "/Splash";
  static const HOME = "/Home";
  static List<GetPage> routes = [
    GetPage(name: PageRoutes.SPLASH, page: () => const SplashScreen()),
    GetPage(name: PageRoutes.HOME, page: () => const Home())
  ];
}
