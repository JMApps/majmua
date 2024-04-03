import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/user_back_button.dart';
import 'cities_list.dart';
import 'search_cities_delegate.dart';

class SelectCityPage extends StatelessWidget {
  const SelectCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.selectCity),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchCitiesDelegate(
                  hintText: appLocale.searchByCitiesAndCountries,
                ),
              );
            },
            splashRadius: 20,
            tooltip: appLocale.searchByCitiesAndCountries,
            icon: Image.asset(
              'assets/icons/search.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const CitiesList(),
    );
  }
}
