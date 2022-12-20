import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/ramadan/lesson_ramadan_item.dart';

class ListLessonsRamadanPage extends StatefulWidget {
  const ListLessonsRamadanPage({Key? key}) : super(key: key);

  @override
  State<ListLessonsRamadanPage> createState() => _ListLessonsRamadanPageState();
}

class _ListLessonsRamadanPageState extends State<ListLessonsRamadanPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        shape: MainAppStyle.appBarShape,
        title: const Text('Уроки Рамадана'),
      ),
      body: FutureBuilder(
        future: _databaseQuery.getLessonsRamadan(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: MainAppStyle.mainPaddingMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return LessonRamadanItem(
                      item: snapshot.data![index],
                    );
                  },
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
