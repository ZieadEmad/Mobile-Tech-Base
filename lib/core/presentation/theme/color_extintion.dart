// import 'package:clean_arc/core/presentation/util/style/colors/color_dark.dart';
// import 'package:clean_arc/core/presentation/util/style/colors/color_ligh.dart';
// import 'package:clean_arc/core/utils_package/utils_package.dart';

import 'package:flutter/material.dart';

import 'colors/color_dark.dart';
import 'colors/color_ligh.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.yellowColor,
    required this.redColor,
    required this.whiteColor,
    required this.borderColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.colorGrey,
    required this.lightGrey,
    required this.lightGrey1,
    required this.textColor,
    required this.colordeepGrey,
    required this.colorLightGrey,
    required this.colorWhiteA,
    required this.greyText,
    required this.greyBorder,
    required this.colorBlack,
    required this.iconColor,
    required this.colorYellow,
    required this.textFieldBorder,
    required this.colorGreyLight,
    required this.categoryColor,
    required this.fillColor,
    required this.hintColor,
  });

  final Color? mainColor;
  final Color? yellowColor;
  final Color? redColor;
  final Color? whiteColor;
  final Color? borderColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color? colorGrey;
  final Color? lightGrey;
  final Color? lightGrey1;
  final Color? textColor;
  final Color? colordeepGrey;
  final Color? colorLightGrey;
  final Color? colorWhiteA;
  final Color? greyText;
  final Color? greyBorder;
  final Color? colorBlack;
  final Color? iconColor;
  final Color? colorYellow;
  final Color? textFieldBorder;
  final Color? colorGreyLight;
  final Color? categoryColor;
  final Color? fillColor;
  final Color? hintColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? yellowColor,
    Color? redColor,
    Color? borderColor,
    Color? whiteColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? colorGrey,
    Color? lightGrey,
    Color? lightGrey1,
    Color? textColor,
    Color? colordeepGrey,
    Color? colorLightGrey,
    Color? colorWhiteA,
    Color? greyText,
    Color? greyBorder,
    Color? colorBlack,
    Color? iconColor,
    Color? colorYellow,
    Color? textFieldBorder,
    Color? colorGreyLight,
    Color? categoryColor,
    Color? containerShadow1,
    Color? hintColor,
  }) {
    return MyColors(
      mainColor: mainColor,
      yellowColor: yellowColor,
      redColor: redColor,
      whiteColor: whiteColor,
      borderColor: borderColor,
      primaryColor: primaryColor!,
      secondaryColor: secondaryColor!,
      colorGrey: colorGrey,
      lightGrey: lightGrey,
      lightGrey1: lightGrey1,
      textColor: textColor,
      colordeepGrey: colordeepGrey,
      colorLightGrey: colorLightGrey,
      colorWhiteA: colorWhiteA,
      greyText: greyText,
      greyBorder: greyBorder,
      colorBlack: colorBlack,
      iconColor: iconColor,
      colorYellow: colorYellow,
      textFieldBorder: textFieldBorder,
      colorGreyLight: colorGreyLight,
      fillColor: containerShadow1,
      categoryColor: categoryColor,
      hintColor: hintColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      yellowColor: yellowColor,
      redColor: redColor,
      borderColor: borderColor,
      whiteColor: whiteColor,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      colorGrey: colorGrey,
      lightGrey: lightGrey,
      lightGrey1: lightGrey1,
      textColor: textColor,
      colordeepGrey: colordeepGrey,
      colorLightGrey: colorLightGrey,
      colorWhiteA: colorWhiteA,
      greyText: greyText,
      greyBorder: greyBorder,
      colorBlack: colorBlack,
      iconColor: iconColor,
      colorYellow: colorYellow,
      textFieldBorder: textFieldBorder,
      colorGreyLight: colorGreyLight,
      fillColor: fillColor,
      categoryColor: categoryColor,
      hintColor: hintColor,
    );
  }

  static MyColors light = const MyColors(
    mainColor: ColorsLight.mainColor,
    yellowColor: ColorsLight.yellowColor,
    redColor: ColorsLight.redColor,
    borderColor: ColorsLight.borderColor,
    primaryColor: ColorsLight.primaryColor,
     secondaryColor: ColorsLight.secondaryColor,
    colorGrey: ColorsLight.colorGrey,
    whiteColor: ColorsLight.whiteColor,
    lightGrey: ColorsLight.lightGrey,
    lightGrey1: ColorsLight.lightGrey1,
    textColor: ColorsLight.textColor,
    colordeepGrey: ColorsLight.colordeepGrey,
    colorLightGrey: ColorsLight.colorLightGrey,
    colorWhiteA: ColorsLight.colorWhiteA,
    greyText: ColorsLight.greyText,
    greyBorder: ColorsLight.greyBorder,
    colorBlack: ColorsLight.colorBlack,
    iconColor: ColorsLight.iconColor,
    colorYellow: ColorsLight.colorYellow,
    textFieldBorder: ColorsLight.textFieldBorder,
    colorGreyLight: ColorsLight.colorGreyLight,
    categoryColor: ColorsLight.categoryColor,
    fillColor: ColorsLight.containerShadow1,
    hintColor: ColorsLight.hintColor,
  );

  static MyColors dark = const MyColors(
    mainColor: ColorsLight.mainColor,
    yellowColor: ColorsLight.yellowColor,
    redColor: ColorsLight.redColor,
    whiteColor: ColorsLight.whiteColor,
    borderColor: ColorsLight.borderColor,
    primaryColor: ColorsDark.primaryColor,
    secondaryColor: ColorsDark.secondaryColor,
    colorGrey: ColorsDark.colorGrey,
    lightGrey: ColorsDark.lightGrey,
    lightGrey1: ColorsDark.lightGrey1,
    textColor: ColorsDark.textColor,
    colordeepGrey: ColorsDark.colordeepGrey,
    colorLightGrey: ColorsDark.colorLightGrey,
    colorWhiteA: ColorsDark.colorWhiteA,
    greyText: ColorsDark.greyText,
    greyBorder: ColorsDark.greyBorder,
    colorBlack: ColorsDark.colorBlack,
    iconColor: ColorsDark.iconColor,
    colorYellow: ColorsDark.colorYellow,
    textFieldBorder: ColorsDark.textFieldBorder,
    colorGreyLight: ColorsDark.colorGreyLight,
    fillColor: ColorsDark.containerShadow1,
    categoryColor: ColorsDark.categoryColor,
    hintColor: ColorsDark.hintColor,
  );
}
