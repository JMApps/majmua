import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';
import '../../widgets/app_error_text.dart';
import '../../widgets/main_description_text.dart';
import '../items/city_item.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key});

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  List<CityEntity> _cities = [];
  List<CityEntity> _recentCities = [];

  late final Future<List<CityEntity>> _futureCities;

  @override
  void initState() {
    _futureCities = Provider.of<CityState>(context, listen: false).getAllCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final String searchValue = context.watch<CityState>().searchValue.toLowerCase().trim();
    return FutureBuilder<List<CityEntity>>(
      future: _futureCities,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return MainDescriptionText(
            text: appLocale.searchIsEmpty,
          );
        }
        if (snapshot.hasData) {
          _cities = snapshot.data!;
          _recentCities = searchValue.isEmpty ? _cities : _cities.where((element) =>
          element.city.toLowerCase().contains(searchValue) || element.country.toLowerCase().contains(searchValue)).toList();
          return _recentCities.isEmpty ? MainDescriptionText(text: appLocale.searchIsEmpty) : Scrollbar(
            child: ListView.builder(
              padding: AppStyles.mainMardingMini,
              itemCount: _recentCities.length,
              itemBuilder: (BuildContext context, int index) {
                return CityItem(
                  cityModel: _recentCities[index],
                  index: index,
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
