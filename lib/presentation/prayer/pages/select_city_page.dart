import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/city_data_repository.dart';
import '../../../data/services/city_database_service.dart';
import '../../../domain/usecases/city_use_case.dart';
import '../../state/city_state.dart';
import '../lists/cities_list.dart';
import '../widgets/search_cities_delegate.dart';

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
          actions: [
            Consumer<CityState>(
              builder: (context, cityState, _) {
                return IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchCitiesDelegate(
                        search: appLocale.search,
                        cityState: cityState,
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/search.png',
                    width: 25,
                    height: 25,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                );
              },
            ),
          ],
        ),
        body: const CitiesList(),
      ),
    );
  }
}
