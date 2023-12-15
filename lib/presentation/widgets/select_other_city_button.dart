import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/themes/app_themes.dart';

class SelectOtherCityButton extends StatelessWidget {
  const SelectOtherCityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FilledButton.tonal(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, RouteNames.selectCityPage);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(appColors.quaternaryColor.withOpacity(0.25)),
      ),
      child: Text(
        appLocale!.selectOtherCity,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
