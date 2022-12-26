import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/data/database/local/service/coordinates_query.dart';
import 'package:majmua/presentation/prayerTime/county_item.dart';

class SelectCity extends StatelessWidget {
  SelectCity({Key? key}) : super(key: key);

  final CoordinatesQuery _coordinatesQuery = CoordinatesQuery();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: AppStyles.mainMargin,
      shape: AppStyles.mainCardBorderRadius,
      child: FutureBuilder<List>(
        future: _coordinatesQuery.getAllCountries(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Выбор города',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CountyItem(
                            countryModelItem: snapshot.data![index],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
