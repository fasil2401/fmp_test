import 'package:fmp_test/view/Homescreen/home_screen.dart';
import 'package:fmp_test/view/Login%20Screen/login_screen.dart';
import 'package:fmp_test/view/Register%20Screen/register_screen.dart';
import 'package:fmp_test/view/Splash%20screen%20/splash_screen.dart';
import 'package:get/get.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
 static List<GetPage> _routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
    ),
     GetPage(
      name: login,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: register,
      page: () => RegisterScreen(),
      transition: Transition.cupertino,
    ),
     GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
    ),
  ];

 static get routes => _routes;
}
