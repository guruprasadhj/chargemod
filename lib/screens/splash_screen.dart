import 'dart:developer';

import 'package:chargemod/screens/error_screen.dart';
import 'package:chargemod/screens/home_screens/main_screen.dart';
import 'package:chargemod/screens/onboarding_screen.dart';
import 'package:chargemod/services/networking.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../configs/enums.dart';
import '../configs/secure_storage.dart';
import '../configs/theme.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // late AnimationController controller;
  NetworkStatus networkStatus = NetworkStatus.checking;
  String? userId;


  void checkServerConnection() async {
    final navigator = Navigator.of(context);
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool isConnected = false;
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      isConnected = true;
    } else {
      isConnected = false;
    }

    if (isConnected) {
      bool isServerReachable = await Networking().testServerConnection();

      if (isServerReachable) {
        networkStatus = NetworkStatus.stable;
        log('Server is reachable');
      } else {
        networkStatus = NetworkStatus.unexpectedError;
        log('Failed to connect to the server');
      }
    } else {
      networkStatus = NetworkStatus.unexpectedError;
      log('No internet connection');
    }

    if (networkStatus == NetworkStatus.stable) {
       userId = await SecureStorage.getUserId();
       if( userId != null){
         final auth = Provider.of<AuthProvider>(context, listen: false);
         await auth.getAccessToken();

         navigator.pushNamed(MainScreen.routeName);
       }else{
         navigator.pushReplacement(
             MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
       }

    }else{
      navigator.pushReplacement(MaterialPageRoute(builder: (context)=>ErrorScreen()));
    }
  }

  @override
  void initState() {

    checkServerConnection();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = (platformBrightness == Brightness.dark);
    return Scaffold(
      backgroundColor: isDarkMode?kDarkBackgroundColor:kLightBackgroundColor,
      body: Center(

        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(isDarkMode?"assets/svg/logo-dark.svg":'assets/svg/logo.svg'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: (networkStatus == NetworkStatus.checking||networkStatus == NetworkStatus.stable)?
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     LinearProgressIndicator(
                      color: kPrimaryColor,
                      backgroundColor: const Color(0x7f8a8a8a).withOpacity(0.5),
                      semanticsLabel: 'Connecting to chargeMOD',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Connecting to chargeMOD",
                          style:Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ) : TextButton.icon(onPressed: () {},
                icon: Icon(Icons.refresh),
                label: Text("Retry"),),
            )

          ],
        ),
      ),
    );
  }
}


