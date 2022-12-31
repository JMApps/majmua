import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/data/database/local/service/coordinates_query.dart';
import 'package:majmua/presentation/prayerTime/country_item.dart';
import 'package:majmua/presentation/prayerTime/search_cities_delegate.dart';

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
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchCitiesDelegate(),
              );
            },
          ),
        ],
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
              ? CupertinoScrollbar(
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CountryItem(
                        cityIndex: index,
                        countryModelItem: snapshot.data![index],
                      );
                    },
                  ),
              )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
