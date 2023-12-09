import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/repositories/custom_cities_data_repository.dart';
import 'package:majmua/domain/entities/custom_city_entity.dart';
import 'package:majmua/domain/usecases/custom_cities_use_case.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/search_custom_city_item.dart';
import 'package:majmua/presentation/widgets/info_data_text.dart';

class SearchCustomCitiesBuilder extends StatefulWidget {
  const SearchCustomCitiesBuilder({super.key, required this.query});

  final String query;

  @override
  State<SearchCustomCitiesBuilder> createState() => _SearchCustomCitiesBuilderState();
}

class _SearchCustomCitiesBuilderState extends State<SearchCustomCitiesBuilder> {
  List<CustomCityEntity> _customCities = [];
  List<CustomCityEntity> _recentCustomCities = [];

  late final CustomCitiesUseCase _customCitiesUseCase;

  @override
  void initState() {
    _customCitiesUseCase = CustomCitiesUseCase(CustomCitiesDataRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return FutureBuilder<List<CustomCityEntity>>(
      future: _customCitiesUseCase.fetchAllCustomCities(),
      builder: (BuildContext context, AsyncSnapshot<List<CustomCityEntity>> snapshot) {
        if (snapshot.hasData) {
          _customCities = snapshot.data!;
          _recentCustomCities = widget.query.isEmpty
              ? _customCities
              : _customCities.where((element) =>
                      element.city.toLowerCase().contains(widget.query.toLowerCase()) ||
                      element.country.toLowerCase().contains(widget.query.toLowerCase())).toList();
          if (snapshot.data!.isEmpty) {
            return InfoDataText(infoText: appLocale!.customCitiesIsEmpty);
          } else if (_recentCustomCities.isEmpty && widget.query.isNotEmpty) {
            return InfoDataText(infoText: appLocale!.queryIsEmpty);
          } else {
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: _recentCustomCities.length,
                itemBuilder: (BuildContext context, int index) {
                  final CustomCityEntity model = _recentCustomCities[index];
                  return SearchCustomCityItem(
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
