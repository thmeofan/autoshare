import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/car_cubit/cars_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/car_model.dart';
import '../../../util/shared_pref_service.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../../constructor/views/option_screen.dart';

class CarsScreen extends StatefulWidget {
  @override
  _CarsScreenState createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  final _carsCubit = CarsCubit(SharedPreferencesService());
  bool _showRentedCars = true;

  @override
  void initState() {
    super.initState();
    _loadCars();
  }

  @override
  void dispose() {
    _carsCubit.close();
    super.dispose();
  }

  void _loadCars() {
    _carsCubit.getCars();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        actions: [
          ToggleButtons(
            borderRadius: BorderRadius.circular(10.0),
            selectedColor: Colors.white,
            color: Colors.white.withOpacity(0.15),
            fillColor: AppColors.blueColor,
            onPressed: (int newIndex) {
              setState(() {
                _showRentedCars = newIndex == 0;
              });
            },
            isSelected: [_showRentedCars, !_showRentedCars],
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                child: Text('Rented', style: HomeScreenTextStyle.description),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                child: Text('For Sale', style: HomeScreenTextStyle.description),
              ),
            ],
          ),
          SizedBox(width: 16.0),
        ],
      ),
      body: BlocBuilder<CarsCubit, List<Car>>(
        bloc: _carsCubit,
        builder: (context, cars) {
          if (cars.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No cars yet', style: HomeScreenTextStyle.description),
                  SizedBox(height: 16.0),
                  ChosenActionButton(
                    text: 'Add Cars',
                    onTap: _loadCars,
                  ),
                ],
              ),
            );
          } else {
            final rentedCars =
                cars.where((car) => car.type == 'rented').toList();
            final forSaleCars =
                cars.where((car) => car.type == 'for sale').toList();
            final displayedCars = _showRentedCars ? rentedCars : forSaleCars;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: displayedCars.length,
                itemBuilder: (context, index) {
                  final car = displayedCars[index];
                  return Card(
                    color: Colors.white.withOpacity(0.15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.file(File(car.photoPath),
                              width: 60, height: 60),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(car.name, style: HomeScreenTextStyle.name),
                                SizedBox(height: 4.0),
                                Text(
                                    '${car.type.toUpperCase()} - \$${car.price}',
                                    style: HomeScreenTextStyle.location),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _carsCubit.deleteCar(car.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: ChosenActionButton(
        text: 'Add Cars',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OptionScreen()),
          );
        },
      ),
    );
  }
}
