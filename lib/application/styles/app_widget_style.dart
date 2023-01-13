import 'package:flutter/material.dart';

class AppWidgetStyle {
  static mainSliverAppbar(String titleName) => SliverAppBar(
        pinned: false,
        floating: false,
        expandedHeight: 100,
        elevation: 3,
        shape: appBarRectangleBorder,
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            titleName,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Nexa',
            ),
          ),
          background: Padding(
            padding: mainPadding,
            child: Image.asset('assets/images/sm_logo.png'),
          ),
          centerTitle: true,
        ),
      );

  static const appBarRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.elliptical(45, 25),
      bottomRight: Radius.elliptical(45, 25),
    ),
  );

  static const mainRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  static const mainRectangleBorderMini = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12.5),
    ),
  );

  static const mainBorderRadius = BorderRadius.all(
    Radius.circular(20),
  );

  static const mainBorderRadiusMini = BorderRadius.all(
    Radius.circular(12.5),
  );

  static const topRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
    ),
  );

  static const bottomRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ),
  );

  static const topAdhanItemPadding = EdgeInsets.only(
    right: 8,
    top: 8,
    left: 8,
    bottom: 4,
  );

  static const bottomAdhanItemPadding = EdgeInsets.only(
    right: 8,
    top: 4,
    left: 8,
    bottom: 8,
  );

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);

  static const verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const verticalPaddingMini = EdgeInsets.symmetric(vertical: 8);
  static const verticalMargin = EdgeInsets.symmetric(vertical: 16);
  static const verticalMarginMini = EdgeInsets.symmetric(vertical: 8);

  static const horizontalPadding = EdgeInsets.symmetric(horizontal: 16);
  static const horizontalPaddingMini = EdgeInsets.symmetric(horizontal: 8);
  static const horizontalMargin = EdgeInsets.symmetric(horizontal: 16);
  static const horizontalMarginMini = EdgeInsets.symmetric(horizontal: 8);
}
