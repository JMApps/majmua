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
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<RestTimeState>(
          builder: (BuildContext context, RestTimeState timeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  tileColor: appColors.glass,
                  shape: AppStyles.topShapeMini,
                  title: Text(
                    !timeState.isRamadan
                        ? !timeState.holidaysRamadan
                            ? appLocale!.daysLeftUntilRamadan
                            : appLocale!.happyRamadan
                        : appLocale!.blessedRamadan,
                    textAlign: timeState.holidaysRamadan
                        ? TextAlign.center
                        : TextAlign.start,
                  ),
                  trailing: CircleAvatar(
                    radius: 22.5,
                    backgroundColor: appColors.primaryColor,
                    child: Text(
                      !timeState.isRamadan
                          ? timeState.getToRamadanDays.toString().substring(1)
                          : timeState.currentHijriTime.hDay.toString(),
                      style: const TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  tileColor: appColors.glass,
                  shape: AppStyles.bottomShapeMini,
                  title: Text(
                    !timeState.isNineDays
                        ? !timeState.holidaysHijjah
                            ? appLocale.daysLeftUntilAdha
                            : appLocale.happyHijjah
                        : appLocale.nineHijjah,
                    textAlign: timeState.holidaysHijjah
                        ? TextAlign.center
                        : TextAlign.start,
                  ),
                  trailing: CircleAvatar(
                    radius: 22.5,
                    backgroundColor: appColors.secondaryColor,
                    child: Text(
                      !timeState.isNineDays
                          ? timeState.getToHijjahDays.toString().substring(1)
                          : timeState.currentHijriTime.hDay.toString(),
                      style: const TextStyle(
                        fontFamily: 'Nexa',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
        ),
      ),
    );
  }
}
