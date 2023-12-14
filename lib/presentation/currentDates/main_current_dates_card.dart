import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/friday_sunnahs_tile.dart';
import 'package:majmua/presentation/currentDates/main_white_days_card.dart';
import 'package:majmua/presentation/currentDates/week_days_row.dart';
import 'package:majmua/presentation/currentDates/weekly_messages.dart';
import 'package:majmua/presentation/currentDates/year_month_day_card.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:majmua/presentation/state/salawat_counter_state.dart';
import 'package:provider/provider.dart';

class MainCurrentDatesCard extends StatelessWidget {
  const MainCurrentDatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final AdhanTimeState adhanTimeState = Provider.of<AdhanTimeState>(context);
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
                AnimatedSize(
                  duration: const Duration(milliseconds: 750),
                  child: Visibility(
                    visible: !adhanTimeState.getIsFriday,
                    child: const FridaySunnahsTile(),
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 750),
                  child: Visibility(
                    visible: !adhanTimeState.getIsFriday,
                    child: const SizedBox(height: 8),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          YearMonthDayCard(
                            monthPercent:
                                timeState.getElapsedMonthPercentage() / 100,
                            day: timeState.currentDateTime.day,
                            month: AppStrings.getMonthName(
                              locale: appLocale!.localeName,
                              number: timeState.currentDateTime.month,
                            ),
                            year:
                                '${timeState.currentDateTime.year} ${appLocale.year.toLowerCase()}',
                            dateColor: appColors.primaryColor,
                          ),
                          const SizedBox(height: 8),
                          YearMonthDayCard(
                            monthPercent:
                                timeState.getElapsedLunarMonthPercentage() /
                                    100,
                            day: timeState.currentHijriTime.hDay,
                            month: AppStrings.getHijriMonthName(
                              locale: appLocale.localeName,
                              number: timeState.currentHijriTime.hMonth,
                            ),
                            year:
                                '${timeState.currentHijriTime.hYear} ${appLocale.year.toLowerCase()}',
                            dateColor: appColors.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      color: appColors.glass,
                      shape: AppStyles.mainShapeMicro,
                      child: Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Provider.of<SalawatCounterState>(context, listen: false).changeSalawatCount;
                              },
                              onLongPress: () {
                                Provider.of<SalawatCounterState>(context, listen: false).resetSalawatCount;
                              },
                              borderRadius: AppStyles.mainBorderRadiusBig,
                              child: Image.asset(
                                'assets/pictures/salawat.png',
                                width: mediaQuery.orientation == Orientation.portrait
                                    ? screenWidth * 0.23
                                    : screenWidth * 0.24,
                                color: timeState.currentDateTime.weekday != 5
                                    ? appColors.primary
                                    : appColors.quaternaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Card(
                              margin: EdgeInsets.zero,
                              color: appColors.primaryColor.withOpacity(0.15),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppStyles.mainBorderRadiusMicro,
                                side: BorderSide(
                                  width: screenWidth * 0.003,
                                  color: appColors.secondaryColor,
                                ),
                              ),
                              child: SizedBox(
                                width: screenWidth * 0.22,
                                child: Text(
                                  context.watch<SalawatCounterState>().getSalawatCount.toString(),
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Bitter',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
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
                AnimatedSize(
                  duration: const Duration(milliseconds: 750),
                  child: Visibility(
                    visible: !timeState.isWhiteDays,
                    child: const SizedBox(height: 8),
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 750),
                  child: Visibility(
                    visible: !timeState.isWhiteDays,
                    child: const MainWhiteDaysCard(),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: appColors.surface,
                            builder: (context) {
                              return WeeklyMessages(
                                dailyMessage: AppStrings.getLongDaily(
                                  locale: appLocale.localeName,
                                  number: timeState.currentDateTime.weekday,
                                ),
                              );
                            },
                          );
                        },
                        tileColor: appColors.glass,
                        shape: AppStyles.leftBottomShapeMini,
                        visualDensity: const VisualDensity(vertical: -2),
                        title: Text(
                          appLocale.reminder,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(
                          CupertinoIcons.checkmark_circle,
                          color: appColors.secondaryColor,
                          size: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.appCounterPage);
                        },
                        tileColor: appColors.glass,
                        shape: AppStyles.rightBottomShapeMini,
                        visualDensity: const VisualDensity(vertical: -2),
                        title: Text(
                          appLocale.counter,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(
                          CupertinoIcons.asterisk_circle,
                          color: appColors.secondaryColor,
                          size: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
