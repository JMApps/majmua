import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/questions/question_item.dart';

class ListQuestionsPage extends StatefulWidget {
  const ListQuestionsPage({Key? key}) : super(key: key);

  @override
  State<ListQuestionsPage> createState() => _ListQuestionsPageState();
}

class _ListQuestionsPageState extends State<ListQuestionsPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF009688),
        shape: MainAppStyle.mainCardBorderRadius,
        title: const Text('200 вопросов'),
      ),
      body: FutureBuilder(
        future: _databaseQuery.getQuestions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: ListView.builder(
                    padding: MainAppStyle.mainPaddingMini,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return QuestionItem(
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.elliptical(35, 20),
            topLeft: Radius.elliptical(35, 20),
          ),
          color: Color(0xFF80CBC4),
        ),
        child: InkWell(
          onTap: () {},
          child: const Card(
            elevation: 0,
            margin: MainAppStyle.mainMargin,
            shape: MainAppStyle.mainCardBorderRadius,
            child: Padding(
              padding: MainAppStyle.mainPadding,
              child: Text(
                'Продолжить чтение 43 вопроса',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
