import 'dart:developer';

import 'package:fmp_test/services/api_provider.dart';
import 'package:fmp_test/services/preferences/shared_preference.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  logoutUser() async {
    isLoading.value = true;
    update();
    String accessToken = AppPreferences.getApiKey() ?? "";
    try {
      var feedback = await ApiServices.execute(
          method: apiMethod.get, url: 'logout', accessToken: accessToken);
      log(feedback.toString());
      if (feedback != null) {
        if (feedback['status'] != null && feedback['status'] == true) {
          AppPreferences.setLogin(false);
          return {"isSuccess": true, "Message": feedback['message']};
        } else {
          return {"isSuccess": false, "Message": feedback['message']};
        }
      } else {
        return {"isSuccess": false, "Message": 'Uncaught Error'};
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
