import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/strings/app_string_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../prayer/pages/prayers_container.dart';
import '../widgets/app_title.dart';
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
            title: const AppTitle(),
            actions: [
              MainIconButton(
                onPressed: () {
                  // Open app settings
                },
                tooltip: appLocale.settings,
                iconName: AppStringConstraints.iconSettings,
                iconColor: appColors.secondary,
              ),
              Padding(
                padding: AppStyles.mardingRightMini,
                child: MainIconButton(
                  onPressed: () {
                    // Open notification settings
                  },
                  tooltip: appLocale.notifications,
                  iconName: AppStringConstraints.iconNotifications,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
