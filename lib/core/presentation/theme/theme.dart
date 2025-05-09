import 'package:arch/core/core/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

part 'text.dart';

part 'app_bar.dart';

class AppTheme {
  static TextTheme textTheme = _textTheme(
    fontFamily: 'fontFamily',
    bodyColor: AppColors.textSecondary,
  );
  ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: textTheme,
    // fontFamily: "Gilroy",
    appBarTheme: _appBarTheme(
      textTheme: textTheme,
      iconColor: AppColors.textSecondary,
    ),
    platform: TargetPlatform.iOS,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );

  static final AppTheme _instance = AppTheme._internal();
  static AppTheme get instance => _instance;

  factory AppTheme() {
    return _instance;
  }
  AppTheme._internal();
}
