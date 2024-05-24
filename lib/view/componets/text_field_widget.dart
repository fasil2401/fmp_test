import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.placeHolder,
      this.icon,
      this.isObscure = false,
      this.type = TextInputType.text});

  final TextEditingController controller;
  final String? placeHolder;
  final String? icon;
  final TextInputType type;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: isObscure,
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.placeholderText),
        borderRadius: BorderRadius.circular(10),
      ),
      style: const TextStyle(fontSize: 18),
      keyboardType: type,
      placeholder: placeHolder,
      placeholderStyle: const TextStyle(
          color: CupertinoColors.placeholderText,
          fontFamily: 'Popins',
          fontWeight: FontWeight.w200,
          fontSize: 14),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      suffix: icon != null
          ? Padding(
              padding: const EdgeInsets.only(right: 4),
              child: SvgPicture.asset(
                icon!,
                // height: 20,
              ),
            )
          : null,
      controller: controller,
      onChanged: (value) {},
    );
  }
}
