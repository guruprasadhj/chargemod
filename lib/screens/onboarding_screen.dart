import 'package:chargemod/Component/there_line_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/theme.dart';
import 'authentication_screens/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController();

  // int pageIndex =0;
  int currentPage = 0;
  int numberOfPages = 3;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        ((MediaQuery.of(context).platformBrightness) == Brightness.dark);
    return Scaffold(
      backgroundColor:
          isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (currentPage != 0)
                ? FloatingActionButton(
              heroTag: "btn1",
                    shape: CircleBorder(),
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                      _pageController.animateToPage(currentPage - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    // isExtended: true,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                    ),
                  )
                : SizedBox(
                    height: 50,
                    width: 50,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildPageIndicator(isDarkMode),
                ),
              ],
            ),

                 FloatingActionButton(
                   heroTag: "btn2",
                    shape: CircleBorder(),
                    // isExtended: true,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                      if(currentPage == (numberOfPages-1)){
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      }
                      else{
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInOut);
                      }

                    },
                  )

          ],
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/map-design-layout-light.svg",
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 474,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    children: [

                      WalkthroughWidget(
                          title: "Charge your EV",
                          slogan:"At Your",
                          highlightedSlogan: "Fingertips",
                          image:SvgPicture.asset(isDarkMode
                              ?"assets/svg/electric-scooter-light.svg":"assets/svg/electric-scooter-dark.svg",
                              fit: BoxFit.fitWidth),
                          description: "Grab The Best In Class\nDigital Experience Crafted For\nEV Drivers",
                          textColor:isDarkMode
                              ? kLightBackgroundColor
                              : kDarkBackgroundColor),
                      WalkthroughWidget(
                          title: "Easy EV Navigation",
                          slogan:"Travel Route",
                          highlightedSlogan: "For Electrics",
                          image:SvgPicture.asset(isDarkMode
                              ?"assets/svg/map-dark.svg":"assets/svg/map-light.svg",
                              fit: BoxFit.fitWidth),
                          description:                             "Scan Charge and Go\nEffortless Charging schemas",

                          textColor:isDarkMode
                              ? kLightBackgroundColor
                              : kDarkBackgroundColor),
                      WalkthroughWidget(
                          title: "interaction with Grid",
                          slogan:"RealTime",
                          highlightedSlogan: "Monitoring",
                          image:Image.asset("assets/images/realtime-monitor.png",fit: BoxFit.fitWidth,),
                          description: "Intelligent Sensible Devices\nAmbicharge Series",
                          textColor:isDarkMode
                              ? kLightBackgroundColor
                              : kDarkBackgroundColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode?kLightBackgroundColor:kDarkBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget walkthroughWidget(
      String title,
      String slogan,
      String highlightedSlogan,
      Widget image,
      String description,
      Color textColor) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: textColor),
          ),
          Text(
            slogan,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w900, color: textColor),
          ),
          Text(
            highlightedSlogan,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: kPrimaryColor),
          ),
          image,
          Text(
            description,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: textColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator(bool isDarkMode) {
    List<Widget> list = [];
    for (int i = 0; i < numberOfPages; i++) {
      list.add(i == currentPage
          ? _indicator(true, isDarkMode)
          : _indicator(false, isDarkMode));
    }
    return list;
  }

  Widget _indicator(bool isActive, bool isDarkMode) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? isDarkMode
                  ? kLightBackgroundColor
                  : kDarkBackgroundColor
              : Color(0XFFEAEAEA),
        ),
      ),
    );
  }
}

class WalkthroughWidget extends StatelessWidget {
  const WalkthroughWidget({super.key, required this.title, required this.slogan, required this.highlightedSlogan, required this.image, required this.description, required this.textColor});

  final String title;
  final String slogan;
  final String highlightedSlogan;
  final Widget image;
  final String description;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ThreeLineBanner(
          firstLine: title,
          secondLine: slogan,
          thirdLine: highlightedSlogan, textColor: textColor,
        ),
        image,
        Text(
          description,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: textColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
