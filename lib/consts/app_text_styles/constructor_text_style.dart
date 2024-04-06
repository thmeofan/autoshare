import 'package:flutter/material.dart';
import '../app_colors.dart';

class ConstructorTextStyle {
  static const TextStyle inputText = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGreyColor);

  static TextStyle label = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreyColor.withOpacity(0.4),
  );
  static TextStyle snackBar = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.blueColor,
  );
  static TextStyle title = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle optionTitleNC = const TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black);

  static TextStyle optionTitleCH = const TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static TextStyle optionDescriptionNC = const TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Colors.black);

  static TextStyle optionDescriptionCH = const TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Colors.white);

  static TextStyle tileDescription = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle photoTile = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blueColor);
  static TextStyle tileTextNC = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreyColor.withOpacity(0.4));
  static TextStyle tileTextCH = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor);
}
