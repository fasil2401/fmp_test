import 'package:fmp_test/utils/routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    checkoutSplash();
    super.onInit();
  }

  checkoutSplash() async {
    await Future.delayed(Duration(seconds: 3), () async {
      Get.toNamed(RouteManager.login);
    });
  }
}
