import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffE6740C);
const Color kDarkBackgroundColor = Color(0xff2E2E2D);
const Color kLightBackgroundColor = Color(0xffffffff);
const Color kFadedWhiteColor = Color(0xffffffff);
const Color kOutlineColor = Color(0xffe4dfdf);
const Color kLightGreyColor = Color(0xff666766);
const Color kLightGreyHintTextColor = Color(0xff534B4A);
const Color kBlackTextColor = Color(0xff1c1b1f);

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      primaryColor: kPrimaryColor,
      indicatorColor: kPrimaryColor,
      hintColor: kLightGreyHintTextColor,
      highlightColor: Colors.black45,
      hoverColor: Colors.black,
      focusColor: Colors.black12,
      disabledColor: Colors.black38,
      cardColor: Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFFE6740C), // Hex color #E6740C
      ),
      fontFamily: "poppins",
      textTheme: TextTheme().copyWith(
        bodyLarge: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        bodyMedium: const TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        bodySmall: const TextStyle(
            fontSize: 12,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        displayLarge: const TextStyle(
            fontSize: 96,
            fontFamily: 'Roboto_300',
            fontWeight: FontWeight.w300,
            color: kBlackTextColor),
      displayMedium: const TextStyle(
            fontSize: 60,
            fontFamily: 'Roboto_300',
            fontWeight: FontWeight.w300,
            color: kBlackTextColor),
        displaySmall: const TextStyle(
            fontSize: 48,
            fontFamily: 'Roboto_300',
            fontWeight: FontWeight.w300,
            color: kBlackTextColor),
        headlineLarge: const TextStyle(
            fontSize: 40,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        headlineMedium: const TextStyle(
            fontSize: 34,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        headlineSmall: const TextStyle(
            fontSize: 34,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        labelLarge: const TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w500,
            color: kBlackTextColor),
        labelMedium: const TextStyle(
            fontSize: 11,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        labelSmall: const TextStyle(
            fontSize: 10,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto_500',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        titleMedium: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto_regular',
            fontWeight: FontWeight.w400,
            color: kBlackTextColor),
        titleSmall: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto_500',
            fontWeight: FontWeight.w500,
            color: kBlackTextColor),
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
