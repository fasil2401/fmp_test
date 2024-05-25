import 'dart:developer';

import 'package:fmp_test/services/api_provider.dart';
import 'package:fmp_test/services/preferences/shared_preference.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-bs-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
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
