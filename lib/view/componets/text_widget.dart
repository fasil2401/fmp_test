import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextStyle style;
  String text;
  bool isSubHead;
  bool isMain;
  TextWidget({
    required this.style,
    required this.text,
    this.isSubHead = false,
    this.isMain = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      
      style: style.copyWith(fontSize:isMain? 18:isSubHead? 16:14),
    );
  }
}
