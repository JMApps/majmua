import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/prayer_state.dart';

class SelectCityItem extends StatelessWidget {
  const SelectCityItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Tooltip(
      message: appLocale.location,
      child: Consumer<PrayerState>(
        builder: (context, prayerState, _) {
          return CupertinoButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.pushNamed(
                context,
                AppRouteNames.pageSelectCity,
              );
            },
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/${AppStringConstraints.iconLocation}.png',
                  height: 25.0,
                  width: 25.0,
                  color: appColors.primary,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    prayerState.city,
                    style: TextStyle(
                      color: appColors.primary,
                      fontFamily: AppStringConstraints.fontGilroy,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
