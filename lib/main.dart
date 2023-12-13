import 'dart:convert';

import 'package:chargemod/configs/theme.dart';
import 'package:chargemod/providers/auth_provider.dart';
import 'package:chargemod/providers/bottom_nav_bar_provider.dart';
import 'package:chargemod/providers/home_provider.dart';
import 'package:chargemod/screens/home_screens/main_screen.dart';
import 'package:chargemod/screens/authentication_screens/login_screen.dart';
import 'package:chargemod/screens/splash_screen.dart';
import 'package:chargemod/services/login_services.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'configs/navigator.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AuthProvider()),
          ChangeNotifierProvider(create: (context)=>BottomNavBarProvider()),
          ChangeNotifierProvider(create: (context)=>HomeDataProvider()),

        ],
        builder: (context,widget) {
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_ , child) {
            return MaterialApp(

              localizationsDelegates: const [
                CountryLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              title: 'Flutter Demo',
                theme: Styles.themeData(false, context),

              darkTheme: Styles.themeData(false, context),
              themeMode: ThemeMode.system,
              onGenerateRoute: RoutesGenerator.generateRoute,
              home: const SplashScreen(),
            );
          }
        );
      }
    );
  }
}

/*
supportedLocales: [
Locale("af"),
Locale("am"),
Locale("ar"),
Locale("az"),
Locale("be"),
Locale("bg"),
Locale("bn"),
Locale("bs"),
Locale("ca"),
Locale("cs"),
Locale("da"),
Locale("de"),
Locale("el"),
Locale("en"),
Locale("es"),
Locale("et"),
Locale("fa"),
Locale("fi"),
Locale("fr"),
Locale("gl"),
Locale("ha"),
Locale("he"),
Locale("hi"),
Locale("hr"),
Locale("hu"),
Locale("hy"),
Locale("id"),
Locale("is"),
Locale("it"),
Locale("ja"),
Locale("ka"),
Locale("kk"),
Locale("km"),
Locale("ko"),
Locale("ku"),
Locale("ky"),
Locale("lt"),
Locale("lv"),
Locale("mk"),
Locale("ml"),
Locale("mn"),
Locale("ms"),
Locale("nb"),
Locale("nl"),
Locale("nn"),
Locale("no"),
Locale("pl"),
Locale("ps"),
Locale("pt"),
Locale("ro"),
Locale("ru"),
Locale("sd"),
Locale("sk"),
Locale("sl"),
Locale("so"),
Locale("sq"),
Locale("sr"),
Locale("sv"),
Locale("ta"),
Locale("tg"),
Locale("th"),
Locale("tk"),
Locale("tr"),
Locale("tt"),
Locale("uk"),
Locale("ug"),
Locale("ur"),
Locale("uz"),
Locale("vi"),
Locale("zh")
],*/
