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

  static const symmetricHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 16);
  static const symmetricHorizontalPaddingMini =
      EdgeInsets.symmetric(horizontal: 8);
  static const symmetricHorizontalMargin = EdgeInsets.symmetric(horizontal: 16);
  static const symmetricHorizontalMarginMini =
      EdgeInsets.symmetric(horizontal: 8);

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

  static const mainBackground = BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.scaleDown,
      opacity: 0.075,
      image: AssetImage(
        'assets/images/main_background.png',
      ),
    ),
  );

  static const mainTextFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  );

  static mainFocusedTextFiledBorder({required Color focusInputColor}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: focusInputColor,
          width: 1,
        ),
      );

  static mainErrorTextFiledBorder({required Color errorInputColor}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: errorInputColor,
          width: 1,
        ),
      );

  static snackBar(String message, Color backgroundColor) => SnackBar(
        duration: const Duration(milliseconds: 2250),
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Nexa',
            fontSize: 16,
          ),
        ),
      );
}
