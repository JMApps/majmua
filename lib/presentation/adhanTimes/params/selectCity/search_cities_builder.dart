import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/repositories/cities_data_repository.dart';
import 'package:majmua/domain/entities/city_entity.dart';
import 'package:majmua/domain/usecases/cities_use_case.dart';
import 'package:majmua/presentation/adhanTimes/params/selectCity/search_city_item.dart';
import 'package:majmua/presentation/widgets/info_data_text.dart';

class SearchCitiesBuilder extends StatefulWidget {
  const SearchCitiesBuilder({super.key, required this.query});

  final String query;

  @override
  State<SearchCitiesBuilder> createState() => _SearchCitiesBuilderState();
}

class _SearchCitiesBuilderState extends State<SearchCitiesBuilder> {
  List<CityEntity> _cities = [];
  List<CityEntity> _recentCities = [];

  late final CitiesUseCase _citiesUseCase;

  @override
  void initState() {
    _citiesUseCase = CitiesUseCase(CitiesDataRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return FutureBuilder<List<CityEntity>>(
      future: _citiesUseCase.fetchAllCities(),
      builder: (BuildContext context, AsyncSnapshot<List<CityEntity>> snapshot) {
        if (snapshot.hasData) {
          _cities = snapshot.data!;
          _recentCities = widget.query.isEmpty
              ? _cities
              : _cities.where((element) =>
                      element.city.toLowerCase().contains(widget.query.toLowerCase()) ||
                      element.country.toLowerCase().contains(widget.query.toLowerCase())).toList();
          if (_recentCities.isEmpty && widget.query.isNotEmpty) {
            return InfoDataText(infoText: appLocale!.queryIsEmpty);
          } else {
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: _recentCities.length,
                itemBuilder: (BuildContext context, int index) {
                  final CityEntity model = _recentCities[index];
                  return SearchCityItem(
                    cityModel: model,
                    index: index,
                  );
                },
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
