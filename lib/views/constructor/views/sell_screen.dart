import 'dart:io';
import 'package:autoshare/views/app/widgets/chosen_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../blocs/car_cubit/cars_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../data/model/car_model.dart';
import '../../app/views/home_screen.dart';
import '../../app/widgets/input_widget.dart';
import '../widgets/color_selection_widget.dart';
import '../widgets/gear_type_selection_widget.dart';
import '../widgets/snaff_bar_utils.dart';

class SellScreen extends StatefulWidget {
  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _photoPath = '';
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _priceController = TextEditingController();
  late String _duration = '';
  late String _gearType = 'automatic';
  late TextEditingController _yearController = TextEditingController();
  late TextEditingController _horsepowerController = TextEditingController();
  late String _color = 'red';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Rent Car'),
          backgroundColor: AppColors.darkGreyColor.withOpacity(0.06),
        ),
        body: Container(
          color: AppColors.darkGreyColor.withOpacity(0.06),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  GestureDetector(
                      onTap: () async {
                        final pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            _photoPath = pickedFile.path;
                          });
                        }
                      },
                      child: _photoPath != null && _photoPath.isNotEmpty
                          ? ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: size.width * 0.75,
                                maxHeight: size.height * 0.2,
                              ),
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: Image.file(
                                  File(_photoPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.darkGreyColor.withOpacity(0.06),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/photo.svg'),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    'Add Photo',
                                    style: ConstructorTextStyle.photoTile,
                                  )
                                ],
                              ))),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'Name',
                    style: ConstructorTextStyle.tileDescription,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  InputWidget(
                    controller: _nameController,
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'Price',
                    style: ConstructorTextStyle.tileDescription,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  InputWidget(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'Gear type',
                    style: ConstructorTextStyle.tileDescription,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  GearTypeSelectionWidget(
                    initialGearType: _gearType,
                    onGearTypeSelected: (gearType) {
                      setState(() {
                        _gearType = gearType;
                      });
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'Year',
                    style: ConstructorTextStyle.tileDescription,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  InputWidget(
                    controller: _yearController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'Horsepower',
                    style: ConstructorTextStyle.tileDescription,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  InputWidget(
                    controller: _horsepowerController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'Color',
                    style: ConstructorTextStyle.tileDescription,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  ColorSelectionWidget(
                    initialColor: _color,
                    onColorSelected: (color) {
                      setState(() {
                        _color = color;
                      });
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  ChosenActionButton(
                    text: 'Done',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (_photoPath.isNotEmpty &&
                            _nameController.text.isNotEmpty &&
                            _priceController.text.isNotEmpty &&
                            _gearType.isNotEmpty &&
                            _yearController.text.isNotEmpty &&
                            _horsepowerController.text.isNotEmpty &&
                            _color.isNotEmpty) {
                          final car = Car(
                            id: UniqueKey().toString(),
                            type: 'sell',
                            photoPath: _photoPath,
                            name: _nameController.text,
                            price: double.parse(_priceController.text),
                            duration: _duration,
                            gearType: _gearType,
                            year: int.parse(_yearController.text),
                            horsepower: int.parse(_horsepowerController.text),
                            color: _color,
                          );
                          context.read<CarsCubit>().addCar(car);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnaffBarUtils.showSnackBar(
                              'Please fill in all the fields',
                              SnackBarType.error,
                            ),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
