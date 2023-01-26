import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/state/weekly_salawat_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/currentDateTime/card_daily_message.dart';
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
              Padding(
                padding: AppWidgetStyle.horizontalPaddingMini,
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
              const SizedBox(height: 8),
              const CardDates(),
              const SizedBox(height: 8),
              Card(
                margin: AppWidgetStyle.horizontalMarginMini,
                color: appColors.glassOnGlassCardColor,
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const CardDailyMessage(),
                    );
                  },
                  shape: AppWidgetStyle.mainRectangleBorder,
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    context.watch<RestTimeState>().getDailyShortMessage,
                    textAlign: TextAlign.center,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                    color: appColors.mainTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
