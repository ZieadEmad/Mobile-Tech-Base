import 'package:arch/core/presentation/theme/color_extintion.dart';
import 'package:arch/core/presentation/theme/colors/color_dark.dart';
import 'package:arch/core/presentation/theme/colors/color_ligh.dart';
import 'package:flutter/material.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: <ThemeExtension<dynamic>>[MyColors.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.whiteColor,
        // fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(AppDimensions.radiusDefault)
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    // fontFamily: 'cairo',
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: <ThemeExtension<dynamic>>[
      MyColors.light,
      // MyAssets.light
    ],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsLight.textColor,
        // fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(AppDimensions.radiusDefault)
      ),
    ),
  );
}
