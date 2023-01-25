import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/model_friday.dart';

class FridayItem extends StatelessWidget {
  const FridayItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ModelFriday item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Card(
        color: appColors.glassOnGlassCardColor,
        margin: AppWidgetStyle.mainMarginMini,
        child: Center(
          child: ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            contentPadding: AppWidgetStyle.mainPaddingMini,
            title: Text(
              item.numberSunnah,
              style: TextStyle(
                fontSize: 16,
                color: appColors.thirdAppColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              item.contentSunnah,
              style: TextStyle(
                fontSize: 16,
                color: appColors.mainTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
