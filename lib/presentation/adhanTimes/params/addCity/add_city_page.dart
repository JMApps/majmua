import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/add_city_bottom_sheet.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/custom_cities_list.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/search_custom_cities_delegate.dart';
import 'package:majmua/presentation/state/custom_cities_state.dart';
import 'package:provider/provider.dart';

class AddCityPage extends StatelessWidget {
  const AddCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CustomCitiesState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.primaryColor,
          title: Text(appLocale!.addMyCity),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchCustomCitiesDelegate(
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
        body: const CustomCitiesList(),
        floatingActionButton: Consumer<CustomCitiesState>(
          builder: (BuildContext context, CustomCitiesState state, _) {
            return FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: appColors.surface,
                  builder: (context) => AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.decelerate,
                    child: AddCityBottomSheet(state: state),
                  ),
                );
              },
              backgroundColor: appColors.quaternaryColor,
              shape: AppStyles.mainShape,
              elevation: 0,
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
