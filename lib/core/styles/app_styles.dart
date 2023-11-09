import 'package:flutter/material.dart';

class AppStyles {
  // Padding/Margin – Main
  static const mainMardingBig = EdgeInsets.all(32);
  static const mainMarding = EdgeInsets.all(16);
  static const mainMardingMini = EdgeInsets.all(8);
  static const mainMardingMicro = EdgeInsets.all(4);

  // Padding/Margin – Symmetric-Horizontal
  static const mardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const mardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);
  static const mardingHorizontalMicro = EdgeInsets.symmetric(horizontal: 4);

  // Padding/Margin – Symmetric-Vertical
  static const mardingVertical = EdgeInsets.symmetric(vertical: 16);
  static const mardingVerticalMini = EdgeInsets.symmetric(vertical: 8);
  static const mardingVerticalMicro = EdgeInsets.symmetric(vertical: 4);

  // Padding/Margin – Only
  static const mardingOnlyLeft = EdgeInsets.only(left: 16);
  static const mardingOnlyLeftMini = EdgeInsets.only(left: 8);
  static const mardingOnlyLeftMicro = EdgeInsets.only(left: 4);

  static const mardingOnlyTop = EdgeInsets.only(top: 16);
  static const mardingOnlyTopMini = EdgeInsets.only(top: 8);
  static const mardingOnlyTopMicro = EdgeInsets.only(top: 4);

  static const mardingOnlyRight = EdgeInsets.only(right: 16);
  static const mardingOnlyRightMini = EdgeInsets.only(right: 8);
  static const mardingOnlyRightMicro = EdgeInsets.only(right: 4);

  static const mardingOnlyBottom = EdgeInsets.only(bottom: 16);
  static const mardingOnlyBottomMini = EdgeInsets.only(bottom: 8);
  static const mardingOnlyBottomMicro = EdgeInsets.only(bottom: 4);

  // Share/BorderRadius – Main
  static const mainShapeBig = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

  static const mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const mainShapeMini = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static const mainBorderRadiusBig = BorderRadius.all(Radius.circular(30));
  static const mainBorderRadius = BorderRadius.all(Radius.circular(20));
  static const mainBorderRadiusMini = BorderRadius.all(Radius.circular(10));

  // Share/BorderRadius – Only
  static const bottomShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.elliptical(35, 25),
      bottomRight: Radius.elliptical(35, 25),
    ),
  );

  static const topShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.elliptical(35, 25),
      topRight: Radius.elliptical(35, 25),
    ),
  );
}
