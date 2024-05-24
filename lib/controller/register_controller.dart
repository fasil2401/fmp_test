import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fmp_test/services/api_provider.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var rePasswordController = TextEditingController().obs;
  var isLoading = false.obs;

  generateRegisterParams() {
    String name = nameController.value.text;
    String email = emailController.value.text;
    String password = passwordController.value.text;
    String passwordConfirmation = rePasswordController.value.text;
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation
    };
  }

  clearData() {
    nameController.value.clear();
    emailController.value.clear();
    passwordController.value.clear();
    rePasswordController.value.clear();
    update();
  }

  checkFields() {
    String name = nameController.value.text;
    String email = emailController.value.text;
    String password = passwordController.value.text;
    String passwordConfirmation = rePasswordController.value.text;

    if (name.isEmpty) {
      return {"isSuccess": false, "Message": 'Please enter name'};
    } else if (email.isEmpty || email.isEmail == false) {
      return {"isSuccess": false, "Message": 'Please enter proper email'};
    } else if (password.isEmpty && passwordConfirmation.isEmpty) {
      return {"isSuccess": false, "Message": 'Please enter Password'};
    } else if (password != passwordConfirmation) {
      return {"isSuccess": false, "Message": 'Password does not match'};
    } else {
      return {
        "isSuccess": true,
      };
    }
  }

  registerUser() async {
    isLoading.value = true;
    update();
    try {
      var feedback = await ApiServices.execute(
          method: apiMethod.post,
          url: 'register',
          data: generateRegisterParams());
      log(feedback.toString());
      if (feedback != null) {
        if (feedback['status'] != null && feedback['status'] == true) {
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
