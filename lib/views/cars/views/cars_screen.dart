import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../blocs/car_cubit/cars_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/car_model.dart';
import '../../../util/shared_pref_service.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../../constructor/views/option_screen.dart';
import '../../constructor/widgets/color_selection_widget.dart';
import '../../constructor/widgets/gear_type_selection_widget.dart';
import '../widgets/car_info_widget.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  final _carsCubit = CarsCubit(SharedPreferencesService());
  bool _showRentedCars = true;
  RangeValues _priceRange = RangeValues(10000, 250000);
  RangeValues _yearRange = RangeValues(1980, 2023);
  String _gearType = 'automatic';
  String _color = 'red';
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
        backgroundColor: AppColors.darkGreyColor.withOpacity(0.06),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Balance',
              style: HomeScreenTextStyle.label,
            ),
            Text(
              '0\$',
              style: HomeScreenTextStyle.name,
            )
          ],
        ),
      ),
      body: Container(
        color: AppColors.darkGreyColor.withOpacity(0.06),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(15.0),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.09,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/rent.svg'),
                            Text('Rent',
                                style: HomeScreenTextStyle.description),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.065,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/sell.svg'),
                            Text('For Sale',
                                style: HomeScreenTextStyle.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/filter.svg'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => _buildFilterDialog(context),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: BlocBuilder<CarsCubit, List<Car>>(
                bloc: _carsCubit,
                builder: (context, cars) {
                  final rentedCars =
                      cars.where((car) => car.type == 'rent').toList();
                  final forSaleCars =
                      cars.where((car) => car.type == 'sell').toList();
                  final displayedCars =
                      _showRentedCars ? rentedCars : forSaleCars;

                  if (displayedCars.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No cars yet',
                              style: HomeScreenTextStyle.description),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: displayedCars.length,
                        itemBuilder: (context, index) {
                          final car = displayedCars[index];
                          return CarInfoWidget(
                            car: car,
                            onDelete: () {
                              _carsCubit.deleteCar(car.id);
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            ChosenActionButton(
              svgAssetPath: 'assets/icons/plus.svg',
              text: 'Add Cars',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => OptionScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDialog(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RangeValues _priceRange = const RangeValues(50000, 100000.0);
    RangeValues _yearRange = const RangeValues(1990.0, 2023.0);

    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Dismiss',
                          style: HomeScreenTextStyle.filterButtons),
                    ),
                    Spacer(),
                    Center(
                      child: Container(
                        width: 45,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Apply the filter
                        _carsCubit.applyFilter(
                          priceRange: _priceRange,
                          yearRange: _yearRange,
                          gearType: _gearType,
                          color: _color,
                        );
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Apply',
                        style: HomeScreenTextStyle.filterButtons,
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price Range', style: HomeScreenTextStyle.info),
                      SizedBox(height: size.height * 0.005),
                      RangeSlider(
                        activeColor: AppColors.blueColor,
                        values: _priceRange,
                        min: 50000,
                        max: 100000.0,
                        divisions: 50,
                        labels: RangeLabels(
                          _priceRange.start.round().toString(),
                          _priceRange.end.round().toString(),
                        ),
                        onChanged: (values) {
                          setState(() {
                            _priceRange = values;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Year Range', style: HomeScreenTextStyle.info),
                      SizedBox(height: size.height * 0.005),
                      RangeSlider(
                        activeColor: AppColors.blueColor,
                        values: _yearRange,
                        min: 1990.0,
                        max: 2023.0,
                        divisions: 33,
                        labels: RangeLabels(
                          _yearRange.start.round().toString(),
                          _yearRange.end.round().toString(),
                        ),
                        onChanged: (values) {
                          setState(() {
                            _yearRange = values;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Color', style: HomeScreenTextStyle.info),
                      SizedBox(height: size.height * 0.005),
                      ColorSelectionWidget(
                        initialColor: _color,
                        onColorSelected: (color) {
                          setState(() {
                            _color = color;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gear Type', style: HomeScreenTextStyle.info),
                      SizedBox(height: size.height * 0.005),
                      GearTypeSelectionWidget(
                        initialGearType: _gearType,
                        onGearTypeSelected: (gearType) {
                          setState(() {
                            _gearType = gearType;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _carsCubit.restoreOriginalCars();
                        Navigator.of(context).pop();
                      },
                      child: Text('Delete all filters',
                          style: HomeScreenTextStyle.filterButtons),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updatePriceRange(RangeValues values, StateSetter setState) {
    setState(() {
      _priceRange = values;
    });
  }

  void _updateYearRange(RangeValues values, StateSetter setState) {
    setState(() {
      _yearRange = values;
    });
  }
}
