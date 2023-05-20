import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/state/weekly_salawat_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/currentDateTime/card_daily_messages.dart';
import 'package:majmua/presentation/currentDateTime/card_daily_ramadan.dart';
import 'package:majmua/presentation/currentDateTime/card_data.dart';
import 'package:majmua/presentation/currentDateTime/item_day_from_week.dart';
import 'package:provider/provider.dart';

class CardWeekDay extends StatelessWidget {
  const CardWeekDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeeklySalawatState(),
        ),
      ],
      child: Card(
        margin: AppWidgetStyle.horizontalPaddingMini,
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.easeOutQuad,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Card(
                color: appColors.glassOnGlassCardColor,
                margin: AppWidgetStyle.horizontalMarginMini,
                child: Padding(
                  padding: AppWidgetStyle.mainPaddingMini,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceEvenly,
                    runSpacing: 8,
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      ItemDayFromWeek(
                        dayNumber: 1,
                      ),
                      ItemDayFromWeek(
                        dayNumber: 2,
                      ),
                      ItemDayFromWeek(
                        dayNumber: 3,
                      ),
                      ItemDayFromWeek(
                        dayNumber: 4,
                      ),
                      ItemDayFromWeek(
                        dayNumber: 5,
                      ),
                      ItemDayFromWeek(
                        dayNumber: 6,
                      ),
                      ItemDayFromWeek(
                        dayNumber: 7,
                      ),
                    ],
                  ),
                ),
              ),
              const CardDates(),
              Row(
                children: [
                  Expanded(
                    child: context.watch<RestTimeState>().getIsRamadan
                        ? const CardDailyRamadan()
                        : const CardDailyMessages(),
                  ),
                  Card(
                    color: appColors.glassOnGlassCardColor,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'app_counter_page');
                      },
                      tooltip: AppString.counter,
                      splashRadius: 17.5,
                      visualDensity: const VisualDensity(vertical: -4),
                      icon: Icon(
                        CupertinoIcons.number_circle_fill,
                        color: appColors.thirdAppColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
