import 'package:chargemod/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_bar_provider.dart';
import '../screens/home_screens/main_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(builder: (context, data, child) {
      return BottomNavigationBar(
          unselectedItemColor: kDarkBackgroundColor,
          selectedItemColor: kPrimaryColor,
          showUnselectedLabels: true,
          currentIndex: data.currentIndex,
          onTap: (index) async {
            data.updateCurrentIndex(index);
            if (ModalRoute.of(context)!.settings.name != MainScreen.routeName) {
              // print('navigating to home');
              // print(ModalRoute.of(context)!.settings.name);
              await Navigator.pushNamedAndRemoveUntil(
                  context, MainScreen.routeName, (route) => false);
            }
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Diary'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),

             BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/home-icon.svg"), label: 'Home'),
          ]);
    });
  }
}