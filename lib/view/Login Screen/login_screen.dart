import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp_test/controller/login_controller.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/view/componets/button_widget.dart';
import 'package:fmp_test/view/componets/components.dart';
import 'package:fmp_test/view/componets/text_field_widget.dart';
import 'package:fmp_test/view/componets/text_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

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
            // height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppImages.tittle_image),
                TextWidget(
                  text: 'Welcome',
                  isMain: true,
                  style: AppTextStyles.blackHead,
                ),
                TextWidget(
                  text: 'Enter Your Phone Number & Password',
                  isMain: false,
                  isSubHead: true,
                  style: AppTextStyles.greyHeadNormal,
                ),
                TextFieldWidget(
                  controller: loginController.emailController.value,
                  placeHolder: 'Email or Phone Number',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(
                    text: 'Forgot Password?',
                    isMain: false,
                    isSubHead: true,
                    style: AppTextStyles.greyHeadBold
                        .copyWith(color: AppColors.primary),
                  ),
                ),
                TextFieldWidget(
                  controller: loginController.passwordController.value,
                  placeHolder: 'Password',
                  icon: 'assets/icons/eye.svg',
                ),
                BottonWidget(text: 'LOGIN',onPressed: (){},),
              ],
            )),
      ),
    );
  }
}

