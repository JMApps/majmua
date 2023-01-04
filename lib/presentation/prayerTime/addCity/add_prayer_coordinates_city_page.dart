import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/prayerTime/addCity/add_city_item.dart';
import 'package:majmua/presentation/prayerTime/addCity/fab_add_city.dart';
import 'package:provider/provider.dart';

class AddCoordinatesCityPage extends StatefulWidget {
  const AddCoordinatesCityPage({Key? key}) : super(key: key);

  @override
  State<AddCoordinatesCityPage> createState() =>
      _AddCoordinatesCityPageState();
}

class _AddCoordinatesCityPageState
    extends State<AddCoordinatesCityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбрать город'),
      ),
      body: FutureBuilder<List>(
        future: context.watch<CountryCoordinatesState>().coordinatesQuery.getAllCustomCountries(),
        builder: (BuildContext context, snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AddCityItem(
                        item: snapshot.data![index],
                        cityIndex: index,
                      );
                    },
                  ),
                )
              : const Center(
                  child: Padding(
                    padding: AppStyles.mainPadding,
                    child: Text(
                      'Вы не добавили ни одного города',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FabAddCity(),
    );
  }
}
