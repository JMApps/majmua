import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/currentDateTime/item_year_month_day.dart';
import 'package:provider/provider.dart';

class MainCardCurrentDateTimes extends StatelessWidget {
  const MainCardCurrentDateTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppWidgetStyle.horizontalPaddingMini,
      child: Consumer<RestTimeState>(
        builder: (BuildContext context, restTimeState, _) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Card(
                      child: ItemYearMonthDay(
                        year: restTimeState.getCdt.year,
                        month: restTimeState.getMonthName,
                        day: restTimeState.getCdt.day,
                        color: appColors.firstAppColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 5,
                    child: Card(
                      child: ItemYearMonthDay(
                        year: restTimeState.getChdt.hYear,
                        month: restTimeState.getMonthHijriName,
                        day: restTimeState.getChdt.hDay,
                        color: appColors.secondAppColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
