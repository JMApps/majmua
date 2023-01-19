import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/data/database/queries/default_custom_country_query.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/item_another_city.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/search_default_cities_delegate.dart';

class SelectAnotherCityPage extends StatefulWidget {
  const SelectAnotherCityPage({Key? key}) : super(key: key);

  @override
  State<SelectAnotherCityPage> createState() => _SelectAnotherCityPageState();
}

class _SelectAnotherCityPageState extends State<SelectAnotherCityPage> {
  final DefaultCustomCountryQuery _defaultCustomCountryQuery = DefaultCustomCountryQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              AppString.selectionCity,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchDefaultCitiesDelegate(
                      hintText: AppString.searchCities,
                    ),
                  );
                },
                splashRadius: 20,
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          FutureBuilder<List>(
            future: _defaultCustomCountryQuery.getAllDefaultCountries(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: AppWidgetStyle.mainPadding,
                      child: Text(
                        '${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
              return snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ItemAnotherCity(
                            index: index,
                            item: snapshot.data![index],
                          );
                        },
                        childCount: snapshot.data!.length,
                      ),
                    )
                  : const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
