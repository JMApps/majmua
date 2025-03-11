import 'package:flutter/material.dart';

import '../strings/app_string_constraints.dart';

class AppStyles {
  static const mainMarding = EdgeInsets.all(16);
  static const mainMardingMini = EdgeInsets.all(8);
  static const mainMardingMicro = EdgeInsets.all(4);
  static const mainMardingMicroMini = EdgeInsets.all(2);

  static const mardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const mardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);
  static const mardingHorizontalMicro = EdgeInsets.symmetric(horizontal: 4);

  static const mardingWithoutBottom = EdgeInsets.only(left: 16, top: 16, right: 16);
  static const mardingWithoutBottomMini = EdgeInsets.only(left: 8, top: 8, right: 8);

  static const mardingWithoutTop = EdgeInsets.only(left: 16, bottom: 16, right: 16);
  static const mardingWithoutTopMini = EdgeInsets.only(left: 8, bottom: 8, right: 8);

  static const mardingVertical = EdgeInsets.symmetric(vertical: 16);
  static const mardingVerticalMini = EdgeInsets.symmetric(vertical: 8);
  static const mardingVerticalMicro = EdgeInsets.symmetric(vertical: 4);

  static const mardingLeft = EdgeInsets.only(left: 16);
  static const mardingLeftLocation = EdgeInsets.only(left: 12);
  static const mardingLeftMini = EdgeInsets.only(left: 8);

  static const mardingTop = EdgeInsets.only(top: 16);
  static const mardingTopMini = EdgeInsets.only(top: 8);
  static const mardingTopMicroMini = EdgeInsets.only(top: 2);

  static const mardingRight = EdgeInsets.only(right: 16);
  static const mardingRightMini = EdgeInsets.only(right: 8);

  static const mardingBottom = EdgeInsets.only(bottom: 16);
  static const mardingBottomMini = EdgeInsets.only(bottom: 8);

  static const mainShapeBig = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(150)));
  static const mainShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));
  static const mainShapeMini = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)));
  static const mainShapeMicro = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)));

  static const shapeTopBig = RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)));

  static const borderWithoutBottom = RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)));
  static const borderWithoutBottomMini = RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(2.5), bottomRight: Radius.circular(2.5),));

  static const mainBorderBig = BorderRadius.all(Radius.circular(150));
  static const mainBorder = BorderRadius.all(Radius.circular(20));
  static const mainBorderMini = BorderRadius.all(Radius.circular(10));
  static const mainBorderMicro = BorderRadius.all(Radius.circular(5));

  static const mainTextStyleBig = TextStyle(fontSize: 20.0, fontFamily: AppStringConstraints.fontGilroy);
  static const mainTextStyleBigBold = TextStyle(fontSize: 20.0, fontFamily: AppStringConstraints.fontGilroy, fontWeight: FontWeight.bold);
  static const mainTextStyle = TextStyle(fontSize: 18.0, fontFamily: AppStringConstraints.fontGilroy);
  static const mainTextStyleBold = TextStyle(fontSize: 18.0, fontFamily: AppStringConstraints.fontGilroy, fontWeight: FontWeight.bold);
  static const mainTextStyleMini = TextStyle(fontSize: 16.0, fontFamily: AppStringConstraints.fontGilroy);
  static const mainTextStyleMiniBold = TextStyle(fontSize: 16.0, fontFamily: AppStringConstraints.fontGilroy, fontWeight: FontWeight.bold);
  static const mainTextStyleMicro = TextStyle(fontSize: 14.0, fontFamily: AppStringConstraints.fontGilroy);
  static const mainTextStyleMicroBold = TextStyle(fontSize: 14.0, fontFamily: AppStringConstraints.fontGilroy, fontWeight: FontWeight.bold);
}