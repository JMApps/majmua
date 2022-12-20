import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/hadeeths/hadeeth_item.dart';

class ListHadeethsPage extends StatefulWidget {
  const ListHadeethsPage({Key? key}) : super(key: key);

  @override
  State<ListHadeethsPage> createState() => _ListHadeethsPageState();
}

class _ListHadeethsPageState extends State<ListHadeethsPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: MainAppStyle.appBarShape,
        backgroundColor: Colors.grey.shade800,
        title: const Text('40 хадисов'),
      ),
      body: FutureBuilder(
        future: _databaseQuery.getHadeeths(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: ListView.builder(
                    padding: MainAppStyle.mainPaddingMini,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HadeethItem(
                        item: snapshot.data![index],
                      );
                    },
                  ),
                )
              : const Center(
                  child: Padding(
                    padding: MainAppStyle.mainPadding,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
        },
      ),
    );
  }
}
