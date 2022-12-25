import 'package:flutter/material.dart';

class AppStyles {
  static const mainFontSizeStyle = TextStyle(fontSize: 16);

  static const mainNumberFontSizeStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Lato',
  );

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);

  static const symmetricHorizontalPadding = EdgeInsets.symmetric(horizontal: 16);
  static const symmetricHorizontalPaddingMini = EdgeInsets.symmetric(horizontal: 8);
  static const symmetricHorizontalMargin = EdgeInsets.symmetric(horizontal: 16);
  static const symmetricHorizontalMarginMini = EdgeInsets.symmetric(horizontal: 8);

  static const symmetricVerticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const symmetricVerticalPaddingMini = EdgeInsets.symmetric(vertical: 8);
  static const symmetricVerticalMargin = EdgeInsets.symmetric(vertical: 16);
  static const symmetricVerticalMarginMini = EdgeInsets.symmetric(vertical: 8);

  static const mainCardBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );

  static const rightCardBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
  );

  static const leftCardBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ),
  );

  static const topCardBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
    ),
  );

  static const bottomCardBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ),
  );

  static const mainBorderRadius = BorderRadius.all(
    Radius.circular(25),
  );

  static const rightBorderRadius = BorderRadius.only(
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
  );

  static const leftBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(25),
    bottomLeft: Radius.circular(25),
  );

  static const topBorderRadius = BorderRadius.only(
    topRight: Radius.circular(25),
    topLeft: Radius.circular(25),
  );

  static const bottomBorderRadius = BorderRadius.only(
    bottomRight: Radius.circular(25),
    bottomLeft: Radius.circular(25),
  );
}
