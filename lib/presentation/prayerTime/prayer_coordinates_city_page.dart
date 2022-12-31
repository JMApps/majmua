import 'package:flutter/material.dart';
import 'package:majmua/data/database/local/service/coordinates_query.dart';
import 'package:majmua/presentation/prayerTime/county_item.dart';

class PrayerCoordinatesCityPage extends StatefulWidget {
  const PrayerCoordinatesCityPage({Key? key}) : super(key: key);

  @override
  State<PrayerCoordinatesCityPage> createState() =>
      _PrayerCoordinatesCityPageState();
}

class _PrayerCoordinatesCityPageState extends State<PrayerCoordinatesCityPage> {
  final CoordinatesQuery _coordinatesQuery = CoordinatesQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбрать город'),
      ),
      body: FutureBuilder<List>(
        future: _coordinatesQuery.getAllCountries(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText('${snapshot.error}'),
              ),
            );
          }
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CountyItem(
                      countryModelItem: snapshot.data![index],
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
