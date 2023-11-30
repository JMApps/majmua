import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/repositories/cities_data_repository.dart';
import 'package:majmua/domain/entities/city_entity.dart';
import 'package:majmua/domain/usecases/cities_use_case.dart';
import 'package:majmua/presentation/adhanTimes/params/selectCity/city_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key});

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  late final CitiesUseCase _citiesUseCase;

  @override
  void initState() {
    super.initState();
    _citiesUseCase = CitiesUseCase(CitiesDataRepository());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityEntity>>(
      future: _citiesUseCase.fetchAllCities(),
      builder: (BuildContext context, AsyncSnapshot<List<CityEntity>> snapshot) {
        if (snapshot.hasData) {
          return CupertinoScrollbar(
            child: ListView.builder(
              padding: AppStyles.mainMardingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final CityEntity model = snapshot.data![index];
                return CityItem(
                  cityModel: model,
                  index: index,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(
            errorText: snapshot.error.toString(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
