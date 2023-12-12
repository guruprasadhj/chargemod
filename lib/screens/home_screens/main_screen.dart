import 'package:chargemod/configs/theme.dart';
import 'package:chargemod/screens/home_screens/home_screen.dart';
import 'package:chargemod/screens/home_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
class MainScreen extends StatefulWidget {
  static const String routeName = '/main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _myPage = PageController(initialPage: 0);
  int currentIndex = 0;
List<Widget> screens = [
  HomeScreen(),
  Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset("assets/images/coming-soon.png"),
      Text("Activity"),
    ],
  ),),Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset("assets/images/coming-soon.png"),
      Text("Community"),
    ],
  ),),
  ProfileScreen(),
];
initData()async{
  final auth = Provider.of<AuthProvider>(context, listen: false);
  // await auth.getAccessToken();
  auth.getUserDetails();
}

@override
  void initState() {
    initData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
        bottomNavigationBar: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg/home-icon.svg",height: 20,colorFilter: ColorFilter.mode((0==currentIndex)?kPrimaryColor:kDarkBackgroundColor, BlendMode.srcIn)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg/activity-icon.svg",height: 20,colorFilter: ColorFilter.mode((1==currentIndex)?kPrimaryColor:kDarkBackgroundColor, BlendMode.srcIn)),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg/community-icon.svg",height: 20,colorFilter: ColorFilter.mode((2==currentIndex)?kPrimaryColor:kDarkBackgroundColor, BlendMode.srcIn)),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg/profile-icon.svg",height: 20,colorFilter: ColorFilter.mode((3==currentIndex)?kPrimaryColor:kDarkBackgroundColor, BlendMode.srcIn)),
                  label: 'Profile',
                ),
              ],
              currentIndex: currentIndex,
              onTap: (val){
                setState(() {
                  currentIndex = val;
                });
              },
            ),
          ],
        ),
      /*bottomNavigationBar: BottomAppBar(
        color: Colors.white,
          surfaceTintColor:Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 75,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomNavbarIconButton(
                onPressed: (){
                  setState(() {
                    currentIndex = 0;
                  });
                },
                index: 0, currentIndex: currentIndex, svgPath: "assets/svg/home-icon.svg", label: 'Home',),
              BottomNavbarIconButton(
                onPressed: (){
                  setState(() {
                    currentIndex = 1;
                  });
                },
                index: 1, currentIndex: currentIndex, svgPath: "assets/svg/activity-icon.svg", label: 'Activity',),
              BottomNavbarIconButton(
                onPressed: (){
                  setState(() {
                    currentIndex = 2;
                  });
                },
                index: 2, currentIndex: currentIndex, svgPath: "assets/svg/community-icon.svg", label: 'Community',),
              BottomNavbarIconButton(
                onPressed: (){
                  setState(() {
                    currentIndex = 3;
                  });
                },
                index: 3, currentIndex: currentIndex, svgPath: "assets/svg/profile-icon.svg",label:'Profile',),
            ],
          ),
        ),
      ),*/
    );
  }
}

class BottomNavbarIconButton extends StatelessWidget {
  const BottomNavbarIconButton({super.key, required this.index, required this.currentIndex, required this.svgPath, this.onPressed, required this.label});
  final int index;
  final int currentIndex;
  final String svgPath;
  final String label;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 30.0,
          icon: SvgPicture.asset(svgPath,colorFilter: ColorFilter.mode((index==currentIndex)?kPrimaryColor:kDarkBackgroundColor, BlendMode.srcIn)),
          onPressed: onPressed),
        Text(label,style: TextStyle(fontSize: 10,color: (index==currentIndex)?kPrimaryColor:kDarkBackgroundColor),)
      ],
    );
  }
}
