import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/routes/app_route_names.dart';
import '../../core/strings/app_string_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../about/pages/about_us_bottom_sheet.dart';
import '../library/widgets/library_button.dart';
import '../mainbuttons/pages/main_buttons_card.dart';
import '../prayer/pages/day_times_container.dart';
import '../prayer/pages/prayers_container.dart';
import '../ramadan/pages/ramadan_card.dart';
import '../times/items/main_data_item.dart';
import '../times/pages/rest_holidays_container.dart';
import '../times/pages/season_times_container.dart';
import '../times/pages/week_days_container.dart';
import '../widgets/main_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            stretch: true,
            floating: true,
            title: const MainDataItem(),
            actions: [
              MainIconButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  Navigator.pushNamed(
                    context,
                    AppRouteNames.pageAppSettings,
                  );
                },
                tooltip: appLocale.settings,
                iconName: AppStringConstraints.iconSettings,
                iconColor: appColors.secondary,
              ),
              MainIconButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  Navigator.pushNamed(
                    context,
                    AppRouteNames.pageAppNotifications,
                  );
                },
                tooltip: appLocale.notifications,
                iconName: AppStringConstraints.iconNotifications,
                iconColor: appColors.secondary,
              ),
              Padding(
                padding: AppStyles.mardingRightMini,
                child: MainIconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => const AboutUsBottomSheet(),
                    );
                  },
                  tooltip: appLocale.share,
                  iconName: AppStringConstraints.iconLinks,
                  iconColor: appColors.secondary,
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PrayersContainer(),
                RamadanCard(),
                DayTimesContainer(),
                WeekDaysContainer(),
                SeasonTimesContainer(),
                RestHolidaysContainer(),
                MainButtonsCard(),
                SizedBox(height: 4),
                LibraryButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
