import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/country_model.dart';
import 'package:majmua/data/database/local/service/coordinates_query.dart';
import 'package:majmua/presentation/prayerTime/settings/country_item.dart';

class SearchCitiesDelegate extends SearchDelegate {
  final CoordinatesQuery _coordinatesQuery = CoordinatesQuery();

  List<CountryModel> cities = [];
  List<CountryModel> recentCities = [];

  SearchCitiesDelegate({
    String hintText = 'Поиск городов...',
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Theme.of(context).colorScheme.firstAppColor,
                progress: transitionAnimation,
              ),
              onPressed: () {
                query = '';
              },
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.firstAppColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List>(
      future: _coordinatesQuery.getAllCountries(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          cities = snapshot.data;
          recentCities = query.isEmpty
              ? cities
              : cities.where((element) => element.city.toLowerCase().contains(query.toLowerCase()) ||
                      element.country.toLowerCase().contains(query.toLowerCase())).toList();
          return recentCities.isEmpty
              ? Center(
                  child: Text(
                    'По запросу $query ничего не найдено',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentCities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CountryItem(
                        cityIndex: index,
                        countryModelItem: recentCities[index],
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List>(
      future: _coordinatesQuery.getAllCountries(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          cities = snapshot.data;
          recentCities = query.isEmpty
              ? cities
              : cities.where((element) => element.city.toLowerCase().contains(query.toLowerCase()) ||
                      element.country.toLowerCase().contains(query.toLowerCase())).toList();
          return recentCities.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'По запросу $query ничего не найдено',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentCities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CountryItem(
                        cityIndex: index,
                        countryModelItem: recentCities[index],
                      );
                    },
                  ),
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
