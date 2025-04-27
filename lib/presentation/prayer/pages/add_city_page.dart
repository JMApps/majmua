import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/custom_city_data_repository.dart';
import '../../../data/services/databases/custom_city_database_service.dart';
import '../../../domain/usecases/city_use_case.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';
import '../lists/custom_cities_list.dart';
import '../widgets/add_city_bottom_sheet.dart';

class AddCityPage extends StatefulWidget {
  const AddCityPage({super.key});

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final CustomCityDatabaseService _databaseService = CustomCityDatabaseService();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CityState(
            CityUseCase(
              CustomCityDataRepository(_databaseService),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.addCity),
        ),
        body: const CustomCitiesList(),
        floatingActionButton: Consumer<CityState>(
          builder: (context, cityState, _) {
            return FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (newContext) => AnimatedPadding(
                    padding: MediaQuery.of(newContext).viewInsets,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.decelerate,
                    child: AddCityBottomSheet(
                      cityState: cityState,
                    ),
                  ),
                );
              },
              backgroundColor: appColors.inversePrimary,
              elevation: 0.5,
              tooltip: appLocale.addCity,
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
