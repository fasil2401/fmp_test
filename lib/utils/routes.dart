import 'package:fmp_test/view/Login%20Screen/login_screen.dart';
import 'package:fmp_test/view/Splash%20screen%20/splash_screen.dart';
import 'package:get/get.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String login = '/login';
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
  ];

 static get routes => _routes;
}
