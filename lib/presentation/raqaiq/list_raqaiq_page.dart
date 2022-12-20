import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/raqaiq/raqaiq_item.dart';

class ListRaqaiqPage extends StatefulWidget {
  const ListRaqaiqPage({Key? key}) : super(key: key);

  @override
  State<ListRaqaiqPage> createState() => _ListRaqaiqPageState();
}

class _ListRaqaiqPageState extends State<ListRaqaiqPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
        shape: MainAppStyle.appBarShape,
        title: const Text('Ракъаикъ Къуран'),
      ),
      body: FutureBuilder(
        future: _databaseQuery.getRaqaiq(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: ListView.builder(
                    padding: MainAppStyle.mainPaddingMini,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RaqaiqItem(
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
