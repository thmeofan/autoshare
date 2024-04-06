import 'package:autoshare/consts/app_text_styles/constructor_text_style.dart';
import 'package:autoshare/consts/app_text_styles/home_screen_text_style.dart';
import 'package:autoshare/views/constructor/views/rent_screen.dart';
import 'package:autoshare/views/constructor/views/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../consts/app_colors.dart';
import '../../app/widgets/chosen_action_button_widget.dart';

class OptionScreen extends StatefulWidget {
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  String _selectedOption = 'rent';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGreyColor.withOpacity(0.06),
        title: Center(
            child: Text(
          'Add car',
          style: HomeScreenTextStyle.appbar,
        )),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/leading.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AppColors.darkGreyColor.withOpacity(0.06),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'What do you want to display the car for?',
                style: ConstructorTextStyle.title,
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedOption = 'rent';
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedOption == 'rent'
                        ? AppColors.blueColor
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/rent.svg'),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              'Rent',
                              style: _selectedOption == 'rent'
                                  ? ConstructorTextStyle.optionTitleCH
                                  : ConstructorTextStyle.optionTitleNC,
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Rent is billed by the day week or month.',
                          style: _selectedOption == 'rent'
                              ? ConstructorTextStyle.optionDescriptionCH
                              : ConstructorTextStyle.optionDescriptionNC,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedOption = 'sell';
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedOption == 'sell'
                        ? AppColors.blueColor
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/sell.svg'),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              'For sale',
                              style: _selectedOption == 'sell'
                                  ? ConstructorTextStyle.optionTitleCH
                                  : ConstructorTextStyle.optionTitleNC,
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'The car is for sale only.',
                          style: _selectedOption == 'sell'
                              ? ConstructorTextStyle.optionDescriptionCH
                              : ConstructorTextStyle.optionDescriptionNC,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              ChosenActionButton(
                text: 'Continue',
                onTap: () {
                  if (_selectedOption == 'rent') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RentScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SellScreen()),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
