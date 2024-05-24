import 'package:fmp_test/services/preferences/shared_preference.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    checkoutSplash();
    super.onInit();
  }

  checkoutSplash() async {
    bool isLogedIn = AppPreferences.getLogin() ?? false;
    
    await Future.delayed(Duration(seconds: 3), () async {
      if(isLogedIn){
 Get.offNamed(RouteManager.home);
      }else{
        Get.offNamed(RouteManager.login);
      }
      
    });
  }
}
