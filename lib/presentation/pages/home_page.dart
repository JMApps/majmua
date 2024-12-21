import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/strings/app_string_constraints.dart';
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
            stretch: true,
            floating: true,
            title: const AppTitle(),
            actions: [
              MainIconButton(
                onPressed: () {},
                tooltip: appLocale.settings,
                iconName: AppStringConstraints.iconSettings,
                iconColor: appColors.secondary,
              ),
              MainIconButton(
                onPressed: () {},
                tooltip: appLocale.notifications,
                iconName: AppStringConstraints.iconNotifications,
                iconColor: appColors.secondary,
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
