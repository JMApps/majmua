import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ItemMonthRamadan extends StatelessWidget {
  const ItemMonthRamadan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      color: appColors.glassOnGlassCardColor,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2),
        trailing: CircleAvatar(
          radius: 17.5,
          backgroundColor: appColors.firstAppColor,
          child: Center(
            child: Text(
              context.watch<RestTimeState>().getRamadanDay.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          AppString.ramadan,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Nexa',
            color: appColors.mainTextColor,
          ),
        ),
      ),
    );
  }
}
