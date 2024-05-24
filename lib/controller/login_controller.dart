import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fmp_test/services/api_provider.dart';
import 'package:fmp_test/services/preferences/shared_preference.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  var isLoading = false.obs;
  generateLoginParams() {
    String email = emailController.value.text;
    String password = passwordController.value.text;
    return {"email": email, "password": password};
  }

  clearData() {
    emailController.value.clear();
    passwordController.value.clear();
    update();
  }

  checkFields() {
    String email = emailController.value.text;
    String password = passwordController.value.text;

    if (email.isEmpty || email.isEmail == false) {
      return {"isSuccess": false, "Message": 'Please enter proper email'};
    } else if (password.isEmpty) {
      return {"isSuccess": false, "Message": 'Please enter Password'};
    } else {
      return {
        "isSuccess": true,
      };
    }
  }

  loginUser() async {
    isLoading.value = true;
    update();
    try {
      var feedback = await ApiServices.execute(
          method: apiMethod.post, url: 'login', data: generateLoginParams());
      log(feedback.toString());
      if (feedback != null) {
        if (feedback['status'] != null && feedback['status'] == true) {
          AppPreferences.setApiKey(feedback['token']);
          AppPreferences.setLogin(true);
          clearData();
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
