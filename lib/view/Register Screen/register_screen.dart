import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fmp_test/controller/register_controller.dart';
import 'package:fmp_test/services/snackbar_servises.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:fmp_test/view/componets/button_widget.dart';
import 'package:fmp_test/view/componets/components.dart';
import 'package:fmp_test/view/componets/text_field_widget.dart';
import 'package:fmp_test/view/componets/text_widget.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final registerController = Get.put(RegisterController());
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: GetBuilder<RegisterController>(builder: (_) {
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
                        text: 'Create Account',
                        isMain: true,
                        style: AppTextStyles.blackHead,
                      ),
                      TextWidget(
                        text: 'Please Create Your Account',
                        isMain: false,
                        isSubHead: true,
                        style: AppTextStyles.greyHeadNormal,
                      ),
                      _buildSPacer(),
                      TextFieldWidget(
                        controller: _.nameController.value,
                        placeHolder: 'Name',
                      ),
                      _buildSPacer(),
                      TextFieldWidget(
                        controller: _.emailController.value,
                        placeHolder: 'Email',
                      ),
                      _buildSPacer(),
                      TextFieldWidget(
                        controller: _.passwordController.value,
                        placeHolder: 'Password',
                        isObscure: true,
                      ),
                      _buildSPacer(),
                      TextFieldWidget(
                        controller: _.rePasswordController.value,
                        placeHolder: 'Re-type Password',
                      ),
                      _buildSPacer(isBig: true),
                      BottonWidget(
                        text: 'REGISTER NOW',
                        isLoading: _.isLoading.value,
                        onPressed: () async {
                          var validation = _.checkFields();
                          if (validation['isSuccess'] == false) {
                            Get.showSnackbar(getxSnackbar(
                                message: validation['Message'], isError: true));
                          } else {
                            var responce = await _.registerUser();
                            if (responce['isSuccess'] == false) {
                              Get.showSnackbar(getxSnackbar(
                                  message: responce['Message'], isError: true));
                            } else {
                              Get.showSnackbar(getxSnackbar(
                                  message: responce['Message'],
                                  isError: false));
                              Get.offNamed(RouteManager.login);
                            }
                          }
                        },
                      ),
                      _buildSPacer(isBig: true),
                      EasyRichText(
                        'Already Have an Account? Login',
                        defaultStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        patternList: [
                          EasyRichTextPattern(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(RouteManager.login);
                              },
                            targetString: 'Login',
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
      height: isBig ? 35 : 20,
    );
  }

  // Container _buildLoginOption(
  //   Size size, {
  //   required String text,
  //   required String icon,
  // }) {
  //   return Container(
  //     width: size.width,
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(color: AppColors.lightGrey)),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 12),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Image.asset(icon),
  //           TextWidget(
  //             text: text,
  //             isMain: false,
  //             isSubHead: true,
  //             style:
  //                 AppTextStyles.greyHeadNormal.copyWith(color: AppColors.black),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
