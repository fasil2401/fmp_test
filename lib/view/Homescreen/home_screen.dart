import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp_test/controller/home_controller.dart';
import 'package:fmp_test/services/snackbar_servises.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:fmp_test/view/componets/button_widget.dart';
import 'package:fmp_test/view/componets/components.dart';
import 'package:fmp_test/view/componets/text_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.home_back),
                fit: BoxFit.cover,
              ),
            ),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: AppColors.primary),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child:
                                  SvgPicture.asset('assets/icons/Home-3.svg'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  style: AppTextStyles.greyHeadBold
                                      .copyWith(color: Colors.white),
                                  text: 'Location')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
