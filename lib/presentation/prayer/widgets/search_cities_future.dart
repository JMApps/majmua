import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../state/city_state.dart';
import '../../widgets/app_error_text.dart';
import '../../widgets/main_description_text.dart';
import '../items/city_item.dart';

class SearchCitiesFuture extends StatefulWidget {
  const SearchCitiesFuture({
    super.key,
    required this.query,
    required this.cityState,
  });

  final String query;
  final CityState cityState;

  @override
  State<SearchCitiesFuture> createState() => _SearchCitiesFutureState();
}

class _SearchCitiesFutureState extends State<SearchCitiesFuture> {
  List<CityEntity> _cities = [];
  List<CityEntity> _recentCities = [];

  late final Future<List<CityEntity>> _futureCities;

  @override
  void initState() {
    _futureCities = widget.cityState.getAllCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
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
          _recentCities = widget.query.isEmpty ? _cities : _cities.where((element) =>
          element.adminName.contains(widget.query) || element.city.toLowerCase().contains(widget.query) || element.country.toLowerCase().contains(widget.query)).toList();
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
