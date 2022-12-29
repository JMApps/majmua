import 'package:flutter/material.dart';
import 'package:majmua/application/state/pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/questions_query.dart';
import 'package:majmua/presentation/library/questions/question_card.dart';
import 'package:majmua/presentation/library/questions/questions_smooth_indicator.dart';
import 'package:provider/provider.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final QuestionsQuery _questionsQuery = QuestionsQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PagesScrollState>(
          create: (_) => PagesScrollState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('200 вопросов'),
        ),
        body: Consumer<PagesScrollState>(
          builder: (BuildContext context, scrollState, _) {
            return FutureBuilder(
              future: _questionsQuery.getAllQuestions(),
              builder: (BuildContext context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: scrollState.getPageController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionItem(
                                  item: snapshot.data![index],
                                );
                              },
                            ),
                          ),
                          QuestionsSmoothIndicator(
                            pageController: scrollState.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
