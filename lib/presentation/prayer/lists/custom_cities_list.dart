import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';
import '../../widgets/app_error_text.dart';
import '../../widgets/main_description_text.dart';
import '../items/custom_city_item.dart';

class CustomCitiesList extends StatelessWidget {
  const CustomCitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FutureBuilder<List<CityEntity>>(
      future: Provider.of<CityState>(context).getAllCities(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return MainDescriptionText(
            text: appLocale.customCityIsEmpty,
          );
        }
        if (snapshot.hasData) {
          return Scrollbar(
            child: ListView.builder(
              padding: AppStyles.mainMardingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomCityItem(
                  cityModel: snapshot.data![index],
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
