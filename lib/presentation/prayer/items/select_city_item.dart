import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';

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
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRouteNames.pagePrayerParams,
          );
        },
        child: ListTile(
          splashColor: appColors.surface,
          shape: AppStyles.mainShape,
          contentPadding: AppStyles.mardingLeftLocation,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          title: Text(
            'Khasavyurt', // From Hive
            style: TextStyle(
              color: appColors.primary,
              fontSize: 18.0,
              fontFamily: AppStringConstraints.fontGilroy,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Image.asset(
            'assets/icons/location.png',
            height: 25,
            width: 25,
            color: appColors.primary,
          ),
        ),
      ),
    );
  }
}
