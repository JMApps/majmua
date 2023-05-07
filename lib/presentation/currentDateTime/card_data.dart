import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/state/weekly_salawat_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/currentDateTime/item_year_month_day.dart';
import 'package:provider/provider.dart';

class CardDates extends StatelessWidget {
  const CardDates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppWidgetStyle.mainPaddingMini,
      child: Row(
        children: [
          Expanded(
            child: Consumer<RestTimeState>(
              builder: (BuildContext context, restTimeState, _) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Card(
                      color: appColors.glassOnGlassCardColor,
                      child: ItemYearMonthDay(
                        year: restTimeState.getCdt.year,
                        month: restTimeState.getMonthName,
                        day: restTimeState.getCdt.day,
                        color: appColors.firstAppColor,
                      ),
                    ),
                    Card(
                      color: appColors.glassOnGlassCardColor,
                      child: ItemYearMonthDay(
                        year: restTimeState.getChdt.hYear,
                        month: restTimeState.getMonthHijriName,
                        day: restTimeState.getChdt.hDay,
                        color: appColors.secondAppColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          Consumer<WeeklySalawatState>(
            builder: (BuildContext context, weeklySalawatState, _) {
              return Card(
                color: appColors.glassOnGlassCardColor,
                child: Padding(
                  padding: AppWidgetStyle.mainPaddingMini,
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      InkWell(
                        onTap: () {
                          weeklySalawatState.changeSalawatCount();
                        },
                        onLongPress: () {
                          weeklySalawatState.resetSalawatCount();
                        },
                        borderRadius: AppWidgetStyle.mainBorderRadius,
                        child: Image.asset(
                          'assets/images/salawat.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.srcATop,
                          color: context.watch<RestTimeState>().getCdt.weekday == 5
                                  ? appColors.thirdAppColor
                                  : appColors.secondAppColor,
                        ),
                      ),
                      Text(
                        '${weeklySalawatState.getSalawatCount}',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: appColors.mainTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
