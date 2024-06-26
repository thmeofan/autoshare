import 'package:autoshare/consts/app_text_styles/onboarding_text_style.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChosenActionButton extends StatelessWidget {
  const ChosenActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.blueColor,
    this.svgAssetPath,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final Color backgroundColor;
  final String? svgAssetPath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.08,
        left: size.width * 0.02,
        right: size.width * 0.02,
      ),
      child: SizedBox(
        width: size.width * 0.95,
        height: size.height * 0.055,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgAssetPath != null)
                SvgPicture.asset(
                  svgAssetPath!,
                  width: 12,
                  height: 12,
                ),
              if (svgAssetPath != null) SizedBox(width: 8),
              Text(text, style: OnboardingTextStyle.button),
            ],
          ),
        ),
      ),
    );
  }
}
