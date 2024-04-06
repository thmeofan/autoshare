import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  const InputWidget({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor.withOpacity(0.06),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        style: ConstructorTextStyle.inputText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.darkGreyColor.withOpacity(0.06),
          labelStyle: ConstructorTextStyle.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
