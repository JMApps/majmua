import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../l10n/app_localizations.dart';

import '../../core/routes/app_route_names.dart';
import '../../core/strings/app_string_constraints.dart';
import '../counter/widgets/salawat_button.dart';
import '../library/widgets/library_button.dart';
import '../mainbuttons/pages/main_buttons_card.dart';
import '../prayer/pages/day_length_card.dart';
import '../prayer/pages/day_times_container.dart';
import '../prayer/pages/prayers_container.dart';
import '../times/pages/rest_holidays_container.dart';
import '../times/pages/season_times_container.dart';
import '../times/pages/week_days_container.dart';
import '../widgets/app_title.dart';
import '../widgets/main_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: const AppTitle(),
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
              const SizedBox(width: 8),
            ],
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PrayersContainer(),
                DayTimesContainer(),
                DayLengthCard(),
                WeekDaysContainer(),
                SalawatButton(),
                SeasonTimesContainer(),
                RestHolidaysContainer(),
                MainButtonsCard(),
                SizedBox(height: 4),
                LibraryButton(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
