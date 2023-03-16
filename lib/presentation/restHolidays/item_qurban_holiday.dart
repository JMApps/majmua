import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ItemQurbanHoliday extends StatelessWidget {
  const ItemQurbanHoliday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      color: appColors.glassOnGlassCardColor,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2),
        title: Text(
          AppString.qurban,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Nexa',
            color: appColors.mainTextColor,
          ),
          textAlign: context.watch<RestTimeState>().getIsQurban ? TextAlign.center : TextAlign.start,
        ),
      ),
    );
  }
}
