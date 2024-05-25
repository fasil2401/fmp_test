import 'package:flutter/material.dart';

class AppColors {
  //blue theme
  static const Color primary = Color(0xFFF702953);
  static const Color secondary = Color(0xFFF0048D);
  static const Color grey = Color(0xFF767676);
  static const Color lightGrey = Color(0xFF9C9C9C);
  static const Color green = Color(0xFF00B907);
  static const Color black = Color(0xFF151528);
  static const LinearGradient gradient1 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.secondary]);
}
