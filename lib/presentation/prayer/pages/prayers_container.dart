import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../qiblah/qiblah_direction_container.dart';
import '../../widgets/main_icon_button.dart';
import '../items/prayer_item.dart';
import '../items/select_city_item.dart';
import '../widgets/prayer_messages.dart';

class PrayersContainer extends StatelessWidget {
  const PrayersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              child: SelectCityItem(),
            ),
            const SizedBox(width: 8),
            MainIconButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pagePrayerParams,
                );
              },
              tooltip: appLocale.prayerParams,
              iconName: AppStringConstraints.iconParams,
              iconColor: appColors.primary,
            ),
            MainIconButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.pushNamed(
                  context,
                  AppRouteNames.pagePrayerSchedule,
                );
              },
              tooltip: appLocale.prayerCalendar,
              iconName: AppStringConstraints.iconCalendar,
              iconColor: appColors.primary,
            ),
            Padding(
              padding: AppStyles.mardingRightMini,
              child: MainIconButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const QiblahDirectionContainer(),
                  );
                },
                tooltip: appLocale.qiblah,
                iconName: AppStringConstraints.iconQiblah,
                iconColor: appColors.primary,
              ),
            ),
          ],
        ),
        Card(
          elevation: 0,
          margin: AppStyles.mardingHorizontalMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: AppStyles.mardingHorizontalMini,
                child: Row(
                  children: [
                    PrayerItem(
                      prayer: Prayer.fajr,
                      prayerName: appLocale.fajr,
                      prayerIcon: CupertinoIcons.sunrise_fill,
                    ),
                    const SizedBox(width: 8),
                    PrayerItem(
                      prayer: Prayer.dhuhr,
                      prayerName: appLocale.dhuhr,
                      prayerIcon: CupertinoIcons.sun_max_fill,
                    ),
                    const SizedBox(width: 8),
                    PrayerItem(
                      prayer: Prayer.asr,
                      prayerName: appLocale.asr,
                      prayerIcon: CupertinoIcons.sun_min_fill,
                    ),
                    const SizedBox(width: 8),
                    PrayerItem(
                      prayer: Prayer.maghrib,
                      prayerName: appLocale.maghrib,
                      prayerIcon: CupertinoIcons.sunset_fill,
                    ),
                    const SizedBox(width: 8),
                    PrayerItem(
                      prayer: Prayer.isha,
                      prayerName: appLocale.isha,
                      prayerIcon: CupertinoIcons.moon_stars_fill,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const PrayerMessages(),
            ],
          ),
        ),
      ],
    );
  }
}
