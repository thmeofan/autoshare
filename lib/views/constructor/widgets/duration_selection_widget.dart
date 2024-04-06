import 'package:autoshare/consts/app_colors.dart';
import 'package:autoshare/consts/app_text_styles/constructor_text_style.dart';
import 'package:flutter/material.dart';

class DurationSelectionWidget extends StatefulWidget {
  final String initialDuration;
  final Function(String) onDurationSelected;

  DurationSelectionWidget({
    required this.initialDuration,
    required this.onDurationSelected,
  });

  @override
  _DurationSelectionWidgetState createState() =>
      _DurationSelectionWidgetState();
}

class _DurationSelectionWidgetState extends State<DurationSelectionWidget> {
  late String _selectedDuration;

  @override
  void initState() {
    super.initState();
    _selectedDuration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDuration = 'daily';
              });
              widget.onDurationSelected(_selectedDuration);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedDuration == 'daily'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Daily',
                style: _selectedDuration == 'daily'
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
                _selectedDuration = 'weekly';
              });
              widget.onDurationSelected(_selectedDuration);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedDuration == 'weekly'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Weekly',
                style: _selectedDuration == 'weekly'
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
                _selectedDuration = 'monthly';
              });
              widget.onDurationSelected(_selectedDuration);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: _selectedDuration == 'monthly'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Monthly',
                style: _selectedDuration == 'monthly'
                    ? ConstructorTextStyle.tileTextCH
                    : ConstructorTextStyle.tileTextNC,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
