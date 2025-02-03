import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class SelectCityItem extends StatefulWidget {
  const SelectCityItem({super.key});

  @override
  State<SelectCityItem> createState() => _SelectCityItemState();
}

class _SelectCityItemState extends State<SelectCityItem> {
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
            padding: AppStyles.mardingLeftMini,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/${AppStringConstraints.iconLocation}.png',
                  height: 22.5,
                  width: 22.5,
                  color: appColors.primary,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    prayerState.city,
                    style: TextStyle(
                      color: appColors.primary,
                      fontSize: 17.0,
                      fontFamily: AppStringConstraints.fontGilroyMedium,
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
