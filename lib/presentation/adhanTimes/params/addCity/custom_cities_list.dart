import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/domain/entities/custom_city_entity.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/custom_city_item.dart';
import 'package:majmua/presentation/state/custom_cities_state.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:majmua/presentation/widgets/info_data_text.dart';
import 'package:provider/provider.dart';

class CustomCitiesList extends StatelessWidget {
  const CustomCitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<CustomCitiesState>(
      builder: (BuildContext context, CustomCitiesState customCitiesState, _) {
        return FutureBuilder<List<CustomCityEntity>>(
          future: customCitiesState.getAllCustomCities(),
          builder: (BuildContext context, AsyncSnapshot<List<CustomCityEntity>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return CupertinoScrollbar(
                child: ListView.builder(
                  padding: AppStyles.mainMardingMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CustomCityEntity model = snapshot.data![index];
                    return CustomCityItem(
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
              return InfoDataText(
                infoText: appLocale!.customCitiesIsEmpty,
              );
            }
          },
        );
      },
    );
  }
}
