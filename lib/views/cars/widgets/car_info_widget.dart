import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/car_model.dart';

class CarInfoWidget extends StatelessWidget {
  final Car car;
  final VoidCallback? onDelete;

  CarInfoWidget({
    required this.car,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.file(
                  File(car.photoPath),
                  width: double.infinity,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                      style: HomeScreenTextStyle.name,
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gear Type',
                              style: HomeScreenTextStyle.label,
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            Text(
                              "${car.gearType[0].toUpperCase()}${car.gearType.substring(1)}",
                              style: HomeScreenTextStyle.info,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.height * 0.012,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HP',
                              style: HomeScreenTextStyle.label,
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            Text(
                              car.horsepower.toString(),
                              style: HomeScreenTextStyle.info,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.height * 0.012,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color',
                              style: HomeScreenTextStyle.label,
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            Text(
                              "${car.color[0].toUpperCase()}${car.color.substring(1)}",
                              style: HomeScreenTextStyle.info,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.height * 0.012,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Year',
                              style: HomeScreenTextStyle.label,
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            Text(
                              '${car.year}',
                              style: HomeScreenTextStyle.info,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkGreyColor.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: HomeScreenTextStyle.label,
                              ),
                              SizedBox(
                                height: size.height * 0.001,
                              ),
                              Text(
                                '\$${car.price}',
                                style: HomeScreenTextStyle.info,
                              ),
                            ],
                          ),
                          Spacer(),
                          if (onDelete != null)
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/delete.svg',
                                  color: AppColors.blueColor,
                                ),
                                onPressed: onDelete,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
