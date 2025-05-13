import 'package:arch/core/presentation/theme/color_extintion.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MyColors get color => Theme.of(this).extension<MyColors>()!;
  /// [MediaQuery].of(context).size.width
  double get width => MediaQuery.sizeOf(this).width;
  /// [MediaQuery].of(context).size.height
  double get height => MediaQuery.sizeOf(this).height;
  bool get phone => MediaQuery.sizeOf(this).shortestSide < 600;
}
