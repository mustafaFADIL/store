import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/controller__other/NavUserController.dart';
import 'package:store/functions/colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double iconSize = constraints.maxWidth < 600 ? 24 : 28;

        return SafeArea(
          child: Theme(
            data: Theme.of(context).copyWith(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: AppColors.colorNavUser,
                unselectedItemColor: AppColors.colorGrey,
                backgroundColor: AppColors.colorWhite,
                selectedIconTheme: IconThemeData(size: iconSize),
                unselectedIconTheme: IconThemeData(size: iconSize - 4),
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13, // تصغير حجم الخط هنا
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12, // تصغير حجم الخط هنا
                ),
              ),
            ),
            child: Obx(() => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeTabIndex,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              elevation: 8.0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  key: Key('home'),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  key: Key('Favorite'),
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  key: Key('profile'),
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  key: Key('settings'),
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}