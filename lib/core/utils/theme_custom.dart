import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';

class ThemeCustom {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.kPurpleColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: ColorManager.kWhiteColor,
      iconTheme: const IconThemeData(
        color: ColorManager.kDarkPlaceHolder,
      ),
      fontFamily: StringsManager.tajawal,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        headline2: TextStyle(
          fontSize: 25.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        headline3: TextStyle(
          fontSize: 22.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        headline4: TextStyle(
          fontSize: 20.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        headline5: TextStyle(
          fontSize: 18.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        headline6: TextStyle(
          fontSize: 17.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        bodyText1: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
        bodyText2: TextStyle(
          fontSize: 15.w,
          fontWeight: FontWeight.bold,
          color: ColorManager.kBlackColor,
        ),
      ),
      cardColor: ColorManager.kWhiteColor);

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.kDarkAppBar,
      elevation: 0,
    ),
    scaffoldBackgroundColor: ColorManager.kDarkBody,
    fontFamily: StringsManager.tajawal,
    cardColor: ColorManager.kDarkPlaceHolder,
    iconTheme: const IconThemeData(
      color: ColorManager.kWhiteColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      headline2: TextStyle(
        fontSize: 25.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      headline3: TextStyle(
        fontSize: 22.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      headline4: TextStyle(
        fontSize: 20.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      headline5: TextStyle(
        fontSize: 18.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      headline6: TextStyle(
        fontSize: 17.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
      bodyText2: TextStyle(
        fontSize: 15.h,
        fontWeight: FontWeight.bold,
        color: ColorManager.kWhiteColor,
      ),
    ),
  );
}
