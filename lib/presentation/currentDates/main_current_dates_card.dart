import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/week_days_row.dart';
import 'package:majmua/presentation/currentDates/weekly_messages.dart';
import 'package:majmua/presentation/currentDates/year_month_day_card.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class MainCurrentDatesCard extends StatelessWidget {
  const MainCurrentDatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double circleWidgetSize = mediaQuery.size.width * 0.25;
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<RestTimeState>(
          builder: (BuildContext context, RestTimeState timeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const WeekDaysRow(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          YearMonthDayCard(
                            monthPercent: timeState.getElapsedMonthPercentage() / 100,
                            day: timeState.currentDateTime.day,
                            month: AppStyles.getMonthName(
                              locale: appLocale!.localeName,
                              number: timeState.currentDateTime.month,
                            ),
                            year: '${timeState.currentDateTime.year} ${appLocale.year.toLowerCase()}',
                            dateColor: appColors.primaryColor,
                          ),
                          const SizedBox(height: 8),
                          YearMonthDayCard(
                            monthPercent: timeState.getElapsedLunarMonthPercentage() / 100,
                            day: timeState.currentHijriTime.hDay,
                            month: AppStyles.getHijriMonthName(
                              locale: appLocale.localeName,
                              number: timeState.currentHijriTime.hMonth,
                            ),
                            year: '${timeState.currentHijriTime.hYear} ${appLocale.year.toLowerCase()}',
                            dateColor: appColors.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      color: appColors.glass,
                      child: Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius: AppStyles.mainBorderRadiusBig,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: const AssetImage('assets/pictures/salawat.png'),
                                radius: mediaQuery.orientation == Orientation.portrait
                                    ? circleWidgetSize / 2.5
                                    : circleWidgetSize / 1.95,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Card(
                              margin: EdgeInsets.zero,
                              color: appColors.primaryColor.withOpacity(0.15),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppStyles.mainBorderRadius,
                                side: BorderSide(
                                  width: 1,
                                  color: appColors.secondaryColor
                                ),
                              ),
                              child: SizedBox(
                                width: circleWidgetSize / 1.2,
                                child: const Text(
                                  '0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nexa',
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return WeeklyMessages(
                          dailyMessage: AppStyles.getLongDaily(
                            locale: appLocale.localeName,
                            number: timeState.currentDateTime.weekday,
                          ),
                        );
                      },
                    );
                  },
                  tileColor: appColors.glass,
                  shape: AppStyles.mainShape,
                  visualDensity: const VisualDensity(vertical: -2),
                  title: Text(
                    AppStyles.getShortDaily(
                      locale: appLocale.localeName,
                      number: timeState.currentDateTime.weekday,
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Nexa',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: appColors.primaryColor,
                    size: 20,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
