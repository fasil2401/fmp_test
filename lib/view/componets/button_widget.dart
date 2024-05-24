import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_test/utils/colors.dart';
import 'package:fmp_test/view/componets/components.dart';

class BottonWidget extends StatelessWidget {
  BottonWidget({
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    super.key,
  });

  final String text;
  Function() onPressed;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
      width: size.width,
      child: ElevatedButton(
          clipBehavior: Clip.none,
          onPressed: onPressed,
          child: isLoading
              ? CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: AppTextStyles.greyHeadBold
                      .copyWith(color: Colors.white, fontSize: 18),
                )),
    );
  }
}
