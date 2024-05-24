import 'package:flutter/material.dart';
import 'package:fmp_test/services/preferences/shared_preference.dart';
import 'package:fmp_test/services/theme/app_theme.dart';
import 'package:fmp_test/services/theme/theme_helper.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:fmp_test/view/Splash%20screen%20/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await AppPreferences.init();
   String themeKey = AppPreferences.getTheme() ?? AppTheme.light;
  runApp( CustomTheme(
    initialThemeKey: themeKey,
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sejourne',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      initialRoute: RouteManager.splash,
        getPages: RouteManager.routes,
    );
  }
}
