import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/restHolidays/item_holiday.dart';
import 'package:provider/provider.dart';

class MainCardRestHolidays extends StatelessWidget {
  const MainCardRestHolidays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Padding(
        padding: AppWidgetStyle.verticalPaddingMini,
        child: Consumer<RestTimeState>(
          builder: (BuildContext context, restTimeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                restTimeState.getIsRamadan
                    ? Card(
            margin: AppWidgetStyle.horizontalMarginMini,
              color: appColors.glassOnGlassCardColor,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -2),
                trailing: CircleAvatar(
                  radius: 17.5,
                  backgroundColor: appColors.firstAppColor,
                  child: Center(
                    child: Text(
                      restTimeState.getRamadanDay.toString(),
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
            )
                    : ItemHoliday(
                        holidayName: AppString.restRamadan,
                        days: restTimeState.getToRamadanDays,
                        color: appColors.firstAppColor,
                      ),
                const SizedBox(height: 8),
                restTimeState.getIsQurban ? Card(
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
                      textAlign: restTimeState.getIsQurban ? TextAlign.center : TextAlign.start,
                    ),
                  ),
                ) :
                ItemHoliday(
                  holidayName: AppString.restZulHidja,
                  days: restTimeState.getToQurbanDays,
                  color: appColors.secondAppColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
