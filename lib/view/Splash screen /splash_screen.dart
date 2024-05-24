import 'package:flutter/material.dart';
import 'package:fmp_test/controller/splash_screen_controller.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.boarding_back),
              fit: BoxFit.cover,
            ),
          ),
          width: size.width,
          height: size.height,
          child: Center(
            child: Image.asset(AppImages.tittle_image),
          ),
        ),
      ),
    );
  }
}
