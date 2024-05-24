import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_test/controller/home_controller.dart';
import 'package:fmp_test/services/snackbar_servises.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:fmp_test/view/componets/button_widget.dart';
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
          child: Center(
            child: GetBuilder<HomeController>(
              builder: (_) {
                return BottonWidget(
                  text: 'LOGOUT',
                  isLoading: _.isLoading.value,
                  onPressed: () async {
                    var responce = await homeController.logoutUser();
                    if (responce['isSuccess'] == false) {
                      Get.showSnackbar(getxSnackbar(
                          message: responce['Message'], isError: true));
                    } else {
                      Get.offNamed(RouteManager.login);
                    }
                  },
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
