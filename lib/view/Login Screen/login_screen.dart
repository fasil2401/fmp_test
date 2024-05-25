import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fmp_test/controller/login_controller.dart';
import 'package:fmp_test/services/snackbar_servises.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:fmp_test/view/componets/button_widget.dart';
import 'package:fmp_test/view/componets/components.dart';
import 'package:fmp_test/view/componets/text_field_widget.dart';
import 'package:fmp_test/view/componets/text_widget.dart';
import 'package:get/get.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.boarding_back),
                    fit: BoxFit.cover,
                  ),
                ),
                width: size.width,
                height: size.height,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: GetBuilder<LoginController>(builder: (_) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Image.asset(AppImages.tittle_image),
                      const SizedBox(
                        height: 50,
                      ),
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
                      _buildSPacer(),
                      TextFieldWidget(
                        controller: _.emailController.value,
                        placeHolder: 'Email or Phone Number',
                      ),
                      // _buildSPacer(),
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
                      _buildSPacer(),
                      TextFieldWidget(
                        controller: _.passwordController.value,
                        placeHolder: 'Password',
                        isObscure: true,
                        icon: 'assets/icons/eye.svg',
                      ),
                      _buildSPacer(isBig: true),
                      BottonWidget(
                        text: 'LOGIN',
                        isLoading: _.isLoading.value,
                        onPressed: () async {
                          var validation = _.checkFields();
                          if (validation['isSuccess'] == false) {
                            Get.showSnackbar(getxSnackbar(
                                message: validation['Message'], isError: true));
                          } else {
                            var responce = await _.loginUser();
                            if (responce['isSuccess'] == false) {
                              Get.showSnackbar(getxSnackbar(
                                  message: responce['Message'], isError: true));
                            } else {
                              Get.offNamed(RouteManager.home);
                            }
                          }
                        },
                      ),
                      _buildSPacer(isBig: true),
                      TextWidget(
                        text: 'SIGN UP WITH SOCIAL MEDIA',
                        isMain: false,
                        isSubHead: true,
                        style: AppTextStyles.greyHeadNormal.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      _buildSPacer(isBig: true),
                      _buildLoginOption(size,
                          text: 'Continue  With Google',
                          icon: 'assets/images/google_image.png'),
                      _buildSPacer(),
                      _buildLoginOption(size,
                          text: 'Continue  With Facebook',
                          icon: 'assets/images/facebook_image.png'),
                      _buildSPacer(isBig: true),
                      EasyRichText(
                        'Don\'t have an account? Sign Up',
                        defaultStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        patternList: [
                          EasyRichTextPattern(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteManager.register);
                              },
                            targetString: 'Sign Up',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildSPacer({bool isBig = false}) {
    return SizedBox(
      height: isBig ? 35 : 18,
    );
  }

  Container _buildLoginOption(
    Size size, {
    required String text,
    required String icon,
  }) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightGrey.withOpacity(0.8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon),
            TextWidget(
              text: text,
              isMain: false,
              isSubHead: true,
              style:
                  AppTextStyles.greyHeadNormal.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
