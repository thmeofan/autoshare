import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';

class ColorSelectionWidget extends StatefulWidget {
  final String initialColor;
  final Function(String) onColorSelected;

  ColorSelectionWidget({
    required this.initialColor,
    required this.onColorSelected,
  });

  @override
  _ColorSelectionWidgetState createState() => _ColorSelectionWidgetState();
}

class _ColorSelectionWidgetState extends State<ColorSelectionWidget> {
  late String _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.initialColor;
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
                _selectedColor = 'red';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'red'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Red',
                style: _selectedColor == 'red'
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
                _selectedColor = 'orange';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'orange'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Orange',
                style: _selectedColor == 'orange'
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
                _selectedColor = 'yellow';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'yellow'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Yellow',
                style: _selectedColor == 'yellow'
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
                _selectedColor = 'green';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'green'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Green',
                style: _selectedColor == 'green'
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
                _selectedColor = 'blue';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'blue'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Blue',
                style: _selectedColor == 'blue'
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
                _selectedColor = 'purple';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'purple'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Purple',
                style: _selectedColor == 'purple'
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
                _selectedColor = 'pink';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'pink'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Pink',
                style: _selectedColor == 'pink'
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
                _selectedColor = 'brown';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'brown'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Brown',
                style: _selectedColor == 'brown'
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
                _selectedColor = 'gray';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'gray'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Gray',
                style: _selectedColor == 'gray'
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
                _selectedColor = 'black';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'black'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Black',
                style: _selectedColor == 'black'
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
                _selectedColor = 'white';
              });
              widget.onColorSelected(_selectedColor);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: _selectedColor == 'white'
                    ? AppColors.blueColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'White',
                style: _selectedColor == 'white'
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
