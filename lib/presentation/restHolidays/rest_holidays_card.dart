import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/restHolidays/to_adha_days_circle.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class RestHolidaysCard extends StatelessWidget {
  const RestHolidaysCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<RestTimeState>(
      builder: (BuildContext context, RestTimeState timeState, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: appColors.glass,
              shape: AppStyles.mainShapeMicro,
              child: Padding(
                padding: AppStyles.mainMardingMicro,
                child: Row(
                  children: [
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Text(
                        !timeState.isRamadan
                            ? !timeState.holidaysRamadan
                                ? appLocale!.daysLeftUntilRamadan
                                : appLocale!.happyRamadan
                            : appLocale!.blessedRamadan,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: timeState.holidaysRamadan
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    CircleAvatar(
                      radius: screenWidth * 0.05,
                      backgroundColor: appColors.primaryColor,
                      child: Text(
                        !timeState.isRamadan
                            ? timeState.getToRamadanDays.toString().substring(1)
                            : timeState.currentHijriTime.hDay.toString(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                          fontFamily: 'Bitter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              margin: EdgeInsets.zero,
              color: appColors.glass,
              shape: !timeState.isNineDays ? AppStyles.bottomShapeMini : AppStyles.mainShapeMicro,
              child: Padding(
                padding: AppStyles.mainMardingMicro,
                child: Row(
                  children: [
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Text(
                        !timeState.isNineDays
                            ? !timeState.holidaysHijjah
                                ? appLocale.daysLeftUntilAdha
                                : appLocale.happyHijjah
                            : appLocale.nineHijjah,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: timeState.holidaysHijjah
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    CircleAvatar(
                      radius: screenWidth * 0.05,
                      backgroundColor: appColors.secondaryColor,
                      child: Text(
                        !timeState.isNineDays
                            ? timeState.getToHijjahDays.toString().substring(1)
                            : timeState.currentHijriTime.hDay.toString(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                          fontFamily: 'Bitter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: timeState.isNineDays,
              child: const SizedBox(height: 8),
            ),
            Visibility(
              visible: timeState.isNineDays,
              child: Card(
                margin: EdgeInsets.zero,
                color: appColors.glass,
                shape: AppStyles.bottomShapeMini,
                child: Padding(
                  padding: AppStyles.mainMardingMini,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      9,
                      (index) {
                        return ToAdhaDaysCircle(
                          dayNumber: index + 1,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
