import 'package:flutter/material.dart';
import 'package:majmua/application/state/book_pages_scroll_state.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/data/database/queries/questions_query.dart';
import 'package:majmua/presentation/library/questions/question_item.dart';
import 'package:majmua/presentation/library/questions/questions_smooth_indicator.dart';
import 'package:majmua/presentation/widgets/button_main_text_settings.dart';
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
        ChangeNotifierProvider<BookPagesScrollState>(
          create: (_) => BookPagesScrollState(
              keyForSettingsInitialization: AppConstants.keyQuestionsLastPage),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppString.bookQuestions),
          actions: const [
            ButtonMainTextSettings(),
          ],
        ),
        body: Consumer<BookPagesScrollState>(
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
                              onPageChanged: (page) {
                                scrollState.changePageForLast(
                                  currentPage: page,
                                );
                              },
                            ),
                          ),
                          QuestionsSmoothIndicator(
                            pageController: scrollState.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                          const SizedBox(height: 8),
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
