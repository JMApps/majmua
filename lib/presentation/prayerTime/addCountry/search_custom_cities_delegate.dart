import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/data/database/models/custom_country_model.dart';
import 'package:majmua/data/database/queries/default_custom_country_query.dart';
import 'package:majmua/presentation/prayerTime/addCountry/item_another_custom_city.dart';

class SearchCustomCitiesDelegate extends SearchDelegate {
  final DefaultCustomCountryQuery _defaultCustomCountryQuery = DefaultCustomCountryQuery();

  List<CustomCountryModel> cities = [];
  List<CustomCountryModel> recentCities = [];

  SearchCustomCitiesDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {
                query = '';
              },
              splashRadius: 20,
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.red.shade50,
                progress: transitionAnimation,
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      splashRadius: 20,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List>(
      future: _defaultCustomCountryQuery.getAllCustomCountries(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          cities = snapshot.data;
          recentCities = query.isEmpty ? cities
              : cities.where((element) => element.city.toLowerCase().contains(query.toLowerCase()) ||
                      element.country.toLowerCase().contains(query.toLowerCase())).toList();
          return recentCities.isEmpty
              ? const Center(
                  child: Text(
                    AppString.searchQueryIsEmpty,
                    style: TextStyle(
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
                      return ItemAnotherCustomCity(
                        index: index,
                        item: recentCities[index],
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: Padding(
              padding: AppWidgetStyle.mainPadding,
              child: Text(
                AppString.listCitiesIsEmpty,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List>(
      future: _defaultCustomCountryQuery.getAllCustomCountries(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          cities = snapshot.data;
          recentCities = query.isEmpty
              ? cities
              : cities.where((element) => element.city.toLowerCase().contains(query.toLowerCase()) ||
                      element.country.toLowerCase().contains(query.toLowerCase())).toList();
          return recentCities.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      AppString.searchQueryIsEmpty,
                      style: TextStyle(
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
                      return ItemAnotherCustomCity(
                        index: index,
                        item: recentCities[index],
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: Padding(
              padding: AppWidgetStyle.mainPadding,
              child: Text(
                AppString.listCitiesIsEmpty,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
