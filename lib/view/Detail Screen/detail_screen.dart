import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp_test/utils/asset_paths.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/view/componets/components.dart';
import 'package:fmp_test/view/componets/text_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.home_back),
                  fit: BoxFit.cover,
                ),
              ),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height / 4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/tileImage.png'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                style: BorderStyle.solid, width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconTab(AppIcons.home, "Apartment", "Studio"),
                            VerticalDivider(),
                            iconTab(AppIcons.accomodation, "Accommodation",
                                "2 Guests"),
                            VerticalDivider(),
                            iconTab(
                                AppIcons.bedrooms, "Studio Bedrooms", "1 Beds"),
                            VerticalDivider(),
                            iconTab(AppIcons.bathrooms, "Bathrooms", "1 Full")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                          style: AppTextStyles.blackHead,
                          isMain: false,
                          isSubHead: true,
                          text: "About This Listing"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sejourne Holiday Homes is happy to offer you a brand new Elegant Studio at partially overlooking the lake.JLT is a vibrant mixed-use Free Zone. High-rise towers look out over manmade lakes, while a world of cafés, restaurants, retail and lifestyle awaits at ground and podium level. Perfect for your next leisure or business trips or simply if you are a resident in need of a sta",
                        style:
                            AppTextStyles.greyHeadNormal.copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                          style: AppTextStyles.blackHead,
                          isMain: false,
                          isSubHead: true,
                          text: "Details"),
                      SizedBox(
                        height: 10,
                      ),
                      detailRow(
                          icon1: AppIcons.price,
                          headText1: "Price:",
                          value1: '350.00AED/Night',
                          icon2: AppIcons.price5,
                          headText2: "Bathrooms",
                          value2: "1"),
                      detailRow(
                          icon1: AppIcons.price1,
                          headText1: "ID:",
                          value1: '5178',
                          icon2: AppIcons.price4,
                          headText2: "Type",
                          value2: "Apartment, Studio"),
                      detailRow(
                        icon1: AppIcons.price2,
                        headText1: "Guests:",
                        value1: '2',
                        icon2: AppIcons.price2,
                        headText2: "Allow Additional Guests",
                      ),
                      detailRow(
                          icon1: AppIcons.price3,
                          headText1: "Beds:",
                          value1: '1',
                          value2: ""),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                          style: AppTextStyles.blackHead,
                          isMain: false,
                          isSubHead: true,
                          text: "Features"),
                      SizedBox(
                        height: 10,
                      ),
                      detailRow(
                          icon1: AppIcons.feature1,
                          value1: 'City skyline view',
                          icon2: AppIcons.feature2,
                          value2: 'Dedicated workspace'),
                      detailRow(
                          icon1: AppIcons.feature3,
                          value1: 'Wifi',
                          icon2: AppIcons.feature7,
                          value2: '55" TV'),
                      detailRow(
                          icon1: AppIcons.feature4,
                          value1: 'Free parking on premises',
                          icon2: AppIcons.feature8,
                          value2: 'Air conditioning'),
                      detailRow(
                          icon1: AppIcons.feature5,
                          value1: 'Washer',
                          icon2: AppIcons.feature9,
                          value2: 'Drying rack for clothing'),
                      detailRow(
                        icon1: AppIcons.feature6,
                        value1: 'Kitchen',
                      )
                    ]),
              )),
          Positioned(
            top: 25,
            right: 25,
            left: 25,
            // width: size.width * 0.9,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _buildIcon('assets/icons/Arrow.svg')),
                Spacer(),
                _buildIcon('assets/icons/share.svg'),
                SizedBox(
                  width: 10,
                ),
                _buildIcon('assets/icons/message.svg'),
              ],
            ),
          )
        ],
      )),
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
                child: bottomItem(mainHead: "Check in", subHead: 'Add dates')),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: bottomItem(mainHead: "Check out", subHead: 'Add dates')),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: bottomItem(mainHead: "Guests", subHead: 'Add guests')),
            SizedBox(
              width: 5,
            ),
            Container(
              width: size.width / 7,
              height: size.width / 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: AppColors.gradient1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      AppIcons.bookNow,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  _buildText("Book Now", isLarge: false, isGrey: false)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar _buildIcon(String icon) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: 25,
        ),
      ),
    );
  }

  Text _buildText(String text, {required bool isLarge, required bool isGrey}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: isLarge ? 10 : 8,
          fontFamily: 'Popins',
          color: isGrey ? AppColors.grey : Colors.white,
          fontWeight: isLarge ? FontWeight.w600 : FontWeight.w400),
    );
  }

  Widget iconTab(String icon, String firstText, String secondText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _buildText(firstText, isLarge: false, isGrey: true),
        _buildText(secondText, isLarge: false, isGrey: true)
      ],
    );
  }

  detailRow(
      {required String icon1,
      String? headText1,
      required String value1,
      String? icon2,
      String? headText2,
      String? value2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: detail(icon1, headText1, value1)),
        Expanded(flex: 3, child: detail(icon2, headText2, value2))
      ],
    );
  }

  detail(String? icon, String? headText, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 25,
            width: 25,
            child: icon == null ? SizedBox() : SvgPicture.asset(icon)),
        SizedBox(
          width: 3,
        ),
        if (headText != null)
          Flexible(
              child: Text(
            headText,
            style: AppTextStyles.greyHeadBold.copyWith(fontSize: 13),
          )),
        if (headText != null)
          SizedBox(
            width: 10,
          ),
        if (value != null)
          Flexible(
              child: Text(
            value,
            style: TextStyle(
                fontSize: 11, fontFamily: 'Popins', color: AppColors.grey),
          ))
      ],
    );
  }

  Widget bottomItem({required String mainHead, required String subHead}) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(13)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mainHead,
            style: TextStyle(
                color: AppColors.grey,
                fontFamily: 'Popins',
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Text(
            subHead,
            style: TextStyle(
                color: AppColors.grey,
                fontFamily: 'Popins',
                fontSize: 8,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
  // Widget iconCard(){
  //   return
  // }
}
