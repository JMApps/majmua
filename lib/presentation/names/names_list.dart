import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/data/database/queries/names_of_query.dart';
import 'package:majmua/presentation/names/name_item.dart';

class NamesList extends StatefulWidget {
  const NamesList({Key? key}) : super(key: key);

  @override
  State<NamesList> createState() => _NamesListState();
}

class _NamesListState extends State<NamesList> {
  final NamesOfQuery _namesOfQuery = NamesOfQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _namesOfQuery.getAllNames(),
      builder: (BuildContext context, snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NameItem(
                      item: snapshot.data![index],
                    );
                  },
                ),
            )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
