import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/friday/model_friday.dart';

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
      margin: const EdgeInsets.only(left: 8),
      elevation: 0,
      shape: AppWidgetStyle.mainRectangleBorder,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: AppWidgetStyle.mainBorderRadius,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            opacity: 0.075,
            colorFilter: ColorFilter.mode(
              appColors.firstAppColor,
              BlendMode.srcATop,
            ),
            image: const AssetImage(
              'assets/images/background_item.png',
            ),
          ),
        ),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: AppWidgetStyle.mainPaddingMini,
          title: Text(
            item.numberSunnah,
            style: TextStyle(
              fontSize: 16,
              color: appColors.thirdAppColor,
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
    );
  }
}
