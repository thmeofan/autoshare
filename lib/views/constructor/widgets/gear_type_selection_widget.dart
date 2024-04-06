import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';

class GearTypeSelectionWidget extends StatefulWidget {
  final String initialGearType;
  final Function(String) onGearTypeSelected;

  GearTypeSelectionWidget({
    required this.initialGearType,
    required this.onGearTypeSelected,
  });

  @override
  _GearTypeSelectionWidgetState createState() =>
      _GearTypeSelectionWidgetState();
}

class _GearTypeSelectionWidgetState extends State<GearTypeSelectionWidget> {
  late String _selectedGearType;

  @override
  void initState() {
    super.initState();
    _selectedGearType = widget.initialGearType;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedGearType = 'automatic';
            });
            widget.onGearTypeSelected(_selectedGearType);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: _selectedGearType == 'automatic'
                  ? AppColors.blueColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Automatic',
              style: _selectedGearType == 'automatic'
                  ? ConstructorTextStyle.tileTextCH
                  : ConstructorTextStyle.tileTextNC,
            ),
          ),
        ),
        SizedBox(
          width: size.height * 0.005,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedGearType = 'manual';
            });
            widget.onGearTypeSelected(_selectedGearType);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: _selectedGearType == 'manual'
                  ? AppColors.blueColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Manual',
              style: _selectedGearType == 'manual'
                  ? ConstructorTextStyle.tileTextCH
                  : ConstructorTextStyle.tileTextNC,
            ),
          ),
        ),
      ],
    );
  }
}
