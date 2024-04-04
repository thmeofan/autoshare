import 'package:flutter/material.dart';

import '../app_colors.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 30.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static TextStyle description = const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 13.0,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle button = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
