
import 'package:flutter/material.dart';
/// Helpers on BuildContext that uses MediaQuery
extension ContextExtension on BuildContext{
  /// [MediaQuery].of(context).size.width
  double get width => MediaQuery.sizeOf(this).width;

  /// [MediaQuery].of(context).size.height
  double get height => MediaQuery.sizeOf(this).height;
  bool get phone => MediaQuery.sizeOf(this).shortestSide < 600;

}
