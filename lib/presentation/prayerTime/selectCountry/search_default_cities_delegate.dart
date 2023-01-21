import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/data/database/models/default_country_model.dart';
import 'package:majmua/data/database/queries/default_custom_country_query.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/item_another_city_delegate.dart';

class SearchDefaultCitiesDelegate extends SearchDelegate {
  final DefaultCustomCountryQuery _defaultCustomCountryQuery =
      DefaultCustomCountryQuery();

  List<DefaultCountryModel> cities = [];
  List<DefaultCountryModel> recentCities = [];

  SearchDefaultCitiesDelegate({
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
      future: _defaultCustomCountryQuery.getAllDefaultCountries(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          cities = snapshot.data;
          recentCities = query.isEmpty
              ? cities
              : cities
                  .where((element) =>
                      element.city
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      element.country
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .toList();
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
                      return ItemAnotherCityDelegate(
                        index: index,
                        item: recentCities[index],
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
      future: _defaultCustomCountryQuery.getAllDefaultCountries(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          cities = snapshot.data;
          recentCities = query.isEmpty
              ? cities
              : cities
                  .where((element) =>
                      element.city
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      element.country
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .toList();
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
                      return ItemAnotherCityDelegate(
                        index: index,
                        item: recentCities[index],
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
