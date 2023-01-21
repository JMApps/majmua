import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/prayerTime/addCountry/fab_add_city.dart';
import 'package:majmua/presentation/prayerTime/addCountry/item_another_custom_city.dart';
import 'package:majmua/presentation/prayerTime/addCountry/search_custom_cities_delegate.dart';
import 'package:provider/provider.dart';

class AddCountryPage extends StatelessWidget {
  const AddCountryPage({Key? key}) : super(key: key);

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
              AppString.addingCity,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchCustomCitiesDelegate(
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
            future: context.watch<PrayerTimeState>().defaultCustomCountryQuery.getAllCustomCountries(),
            builder: (BuildContext context, snapshot) {
              return snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ItemAnotherCustomCity(
                            index: index,
                            item: snapshot.data![index],
                          );
                        },
                        childCount: snapshot.data!.length,
                      ),
                    )
                  : const SliverFillRemaining(
                      child: Center(
                        child: Padding(
                          padding: AppWidgetStyle.mainPadding,
                          child: Text(
                            AppString.listCitiesIsEmpty,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
      floatingActionButton: const FabAddCity(),
    );
  }
}
