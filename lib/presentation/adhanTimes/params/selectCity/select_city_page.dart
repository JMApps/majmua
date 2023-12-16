import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/presentation/adhanTimes/params/selectCity/cities_list.dart';
import 'package:majmua/presentation/adhanTimes/params/selectCity/search_cities_delegate.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';

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
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
        ],
      ),
      body: const CitiesList(),
    );
  }
}
