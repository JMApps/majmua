import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/city_data_repository.dart';
import '../../../data/services/databases/city_database_service.dart';
import '../../../domain/usecases/city_use_case.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';
import '../lists/cities_list.dart';

class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  final CityDatabaseService _cityDatabaseService = CityDatabaseService();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CityState(
            CityUseCase(
              CityDataRepository(_cityDatabaseService),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.selectCity),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 35),
            child: Padding(
              padding: AppStyles.mainMardingMini,
              child: Consumer<CityState>(
                builder: (context, cityState, _) {
                  return CupertinoTextField(
                    autofocus: true,
                    padding: AppStyles.mainMardingMini,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: appColors.onSurface,
                    ),
                    placeholder: appLocale.search,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.search,
                    textAlign: TextAlign.center,
                    placeholderStyle: TextStyle(
                      fontSize: 17.0,
                      color: appColors.secondary.withAlpha(175),
                    ),
                    decoration: BoxDecoration(
                      color: appColors.secondary.withAlpha(25),
                      borderRadius: AppStyles.mainBorderMini,
                      border: Border.all(
                        color: appColors.surface,
                      ),
                    ),
                    onChanged: (String? value) {
                      cityState.searchValue = value!;
                    },
                    clearButtonMode: OverlayVisibilityMode.editing,
                  );
                },
              ),
            ),
          ),
        ),
        body: const CitiesList(),
      ),
    );
  }
}
