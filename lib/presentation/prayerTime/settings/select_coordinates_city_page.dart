import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/data/database/local/service/coordinates_query.dart';
import 'package:majmua/presentation/prayerTime/settings/country_item.dart';
import 'package:majmua/presentation/prayerTime/settings/search_cities_delegate.dart';

class SelectCoordinatesCityPage extends StatefulWidget {
  const SelectCoordinatesCityPage({Key? key}) : super(key: key);

  @override
  State<SelectCoordinatesCityPage> createState() =>
      _SelectCoordinatesCityPageState();
}

class _SelectCoordinatesCityPageState extends State<SelectCoordinatesCityPage> {
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
            splashRadius: 20,
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
