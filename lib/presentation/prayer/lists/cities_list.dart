import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../state/city_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/city_item.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key});

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  late final Future<List<CityEntity>> _futureCities;

  @override
  void initState() {
    super.initState();
    _futureCities = Provider.of<CityState>(context, listen: false).getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityEntity>>(
      future: _futureCities,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final CityEntity cityModel = snapshot.data![index];
              return CityItem(
                cityModel: cityModel,
                index: index,
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
