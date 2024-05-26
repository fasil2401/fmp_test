import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp_test/controller/home_controller.dart';
import 'package:fmp_test/services/snackbar_servises.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/utils/routes.dart';
import 'package:fmp_test/view/Detail%20Screen/detail_screen.dart';
import 'package:fmp_test/view/componets/components.dart';
import 'package:fmp_test/view/componets/text_widget.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: Drawer(),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.home_back),
                fit: BoxFit.cover,
              ),
            ),
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.primary, AppColors.secondary]),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildIcon('assets/icons/Home-3.svg'),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildAppBarText('Location', isLarge: true),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Home-4.svg',
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    _buildAppBarText('Dubai Marina, Dubai',
                                        isLarge: false),
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              var responce = await homeController.logoutUser();
                              if (responce['isSuccess'] == false) {
                                Get.showSnackbar(getxSnackbar(
                                    message: responce['Message'],
                                    isError: true));
                              } else {
                                Get.offNamed(RouteManager.login);
                              }
                            },
                            child: Obx(
                              () => _buildIcon('assets/icons/power-off.svg',
                                  isLoading: homeController.isLoading.value),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _buildIcon('assets/icons/Map.svg'),
                          SizedBox(
                            width: 5,
                          ),
                          _buildIcon('assets/icons/Notification.svg'),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: CupertinoColors.placeholderText),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefix: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset(
                                  'assets/icons/Search.svg',
                                  height: 20,
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              placeholder: 'Search',
                              placeholderStyle: const TextStyle(
                                  color: CupertinoColors.placeholderText,
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child:
                                    SvgPicture.asset('assets/icons/Filter.svg'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                _buildSPacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        style: AppTextStyles.blackHead,
                        text: 'Special For You'),
                    TextWidget(
                        style: AppTextStyles.greyHeadNormal
                            .copyWith(color: AppColors.primary),
                        text: 'See All'),
                  ],
                ),
                GFCarousel(
                  // hasPagination: true,
                  aspectRatio: 15 / 7,
                  activeIndicator: AppColors.primary,
                  passiveIndicator: AppColors.secondary,
                  items: homeController.imageList.map(
                    (url) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        width: size.width,
                        // height: size.width * 0.5,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/tileImage.png',
                            ),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.low,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(children: [
                          Positioned(
                              top: 40,
                              left: 10,
                              child: Text(
                                'Get Special Offer',
                                style: TextStyle(
                                    fontFamily: 'Popins',
                                    fontSize: 14,
                                    color: Colors.white),
                              )),
                          Positioned(
                              top: 60,
                              left: 10,
                              child: Text(
                                'Up to on 40% services',
                                style: TextStyle(
                                    fontFamily: 'Popins',
                                    fontSize: 8,
                                    color: Colors.white),
                              )),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: Text(
                                'All Services Available | T&C Applied',
                                style: TextStyle(
                                    fontFamily: 'Popins',
                                    fontSize: 8,
                                    color: Colors.white),
                              )),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: _bannerTags(
                                  text: 'Limited Time!',
                                  color: AppColors.green)),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: _bannerTags(text: 'Claim Now'))
                        ]),
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {},
                ),
                _buildSPacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        style: AppTextStyles.blackHead, text: 'Location'),
                    TextWidget(
                        style: AppTextStyles.greyHeadNormal
                            .copyWith(color: AppColors.primary),
                        text: 'See All'),
                  ],
                ),
                _buildSPacer(),
                SizedBox(
                  height: size.width * 0.25,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: size.width * 0.2,
                              height: size.width * 0.2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/dummy1.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              'Downtown',
                              style: TextStyle(
                                  fontFamily: 'Popins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: 10),
                ),
                _buildSPacer(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                        style: AppTextStyles.blackHead, text: 'Properties')),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailScreen());
                        },
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    width: size.width * 0.32,
                                    decoration: BoxDecoration(
                                      color: AppColors.black,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/tileImage.png',
                                        ),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.low,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 6,
                                            left: 6,
                                            child: _bannerTags(
                                                text: '1BR, Apartment')),
                                      ],
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      TextWidget(
                                          style: AppTextStyles.greyHeadNormal,
                                          text:
                                              'Stunning Studio Apartment in Dubai Arch (JLT)'),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: _buildTileIconSets(
                                                icon: 'assets/icons/money.svg',
                                                text: 'د.إ13,000 /Night'),
                                          ),
                                          Expanded(
                                            child: _buildTileIconSets(
                                                icon:
                                                    'assets/icons/location.svg',
                                                text: 'JLT, Dubai'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: _buildTileIconSets(
                                                icon:
                                                    'assets/icons/Bedrooms.svg',
                                                text: '1 Beds'),
                                          ),
                                          Expanded(
                                            child: _buildTileIconSets(
                                                icon:
                                                    'assets/icons/Bathrooms.svg',
                                                text: '1 Baths'),
                                          ),
                                          Expanded(
                                            child: _buildTileIconSets(
                                                icon: 'assets/icons/Map.svg',
                                                text: '289 Sqft'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/expand.svg',
                                            height: 25,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/add.svg',
                                            height: 25,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 10)
              ],
            )),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child:
                    bottomItem(icon: "assets/icons/Home.svg", subHead: 'Home')),
            // SizedBox(
            //   width: 5,
            // ),
            Expanded(
                child: bottomItem(
                    icon: "assets/icons/Wishlist.svg", subHead: 'Wishlist')),
            // SizedBox(
            //   width: 5,
            // ),
            Expanded(
                child: bottomItem(
                    icon: "assets/icons/Bookings.svg", subHead: 'Bookings')),
            Expanded(
                child: bottomItem(
                    icon: "assets/icons/Messages.svg", subHead: 'Messages')),
            Expanded(
                child: bottomItem(
                    icon: "assets/icons/Profile.svg", subHead: 'Profile')),
            // SizedBox(
            //   width: 5,
            // ),
          ],
        ),
      ),
    );
  }

  Container _bannerTags({required String text, Color? color}) {
    return Container(
      decoration: BoxDecoration(
          color: color != null ? color : null,
          gradient: color != null ? null : AppColors.gradient1,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Popins', fontSize: 9, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Text _buildText(String text, {required bool isLarge, required bool isGrey}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: isLarge ? 12 : 10,
          fontFamily: 'Popins',
          color: isGrey ? AppColors.grey : AppColors.lightGrey,
          fontWeight: isLarge ? FontWeight.w600 : FontWeight.w400),
    );
  }

  Widget bottomItem({required String icon, required String subHead}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        _buildText(subHead, isLarge: false, isGrey: false)
      ],
    );
  }

  Row _buildTileIconSets({required String text, required String icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 10,
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: 20,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Popins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.grey),
          ),
        )
      ],
    );
  }

  SizedBox _buildSPacer({bool isBig = false}) {
    return SizedBox(
      height: isBig ? 35 : 12,
    );
  }

  CircleAvatar _buildIcon(String icon, {bool isLoading = false}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Center(
        child: isLoading
            ? CupertinoActivityIndicator()
            : SvgPicture.asset(
                icon,
                height: 25,
              ),
      ),
    );
  }

  Text _buildAppBarText(String text, {required bool isLarge}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: isLarge ? 14 : 10,
          fontFamily: 'Popins',
          color: Colors.white,
          fontWeight: isLarge ? FontWeight.w600 : FontWeight.w400),
    );
  }
}
