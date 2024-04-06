import 'package:autoshare/views/cars/views/cars_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../data/model/news_model.dart';
import '../../news/views/news_screen.dart';
import '../../settings/views/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    CarsScreen(),
    NewsScreen(
      newsModel: news,
    ),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cars.svg',
              height: size.height * 0.03,
              color: currentIndex == 0
                  ? AppColors.blueColor.withOpacity(1)
                  : AppColors.darkGreyColor.withOpacity(0.5),
            ),
            label: 'cars',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/news.svg',
              height: size.height * 0.03,
              color: currentIndex == 1
                  ? AppColors.blueColor
                  : AppColors.darkGreyColor.withOpacity(0.5),
            ),
            label: 'news',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                height: size.height * 0.03,
                color: currentIndex == 2
                    ? AppColors.blueColor
                    : AppColors.darkGreyColor.withOpacity(0.5),
              ),
              label: 'settings'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
