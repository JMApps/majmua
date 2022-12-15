import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/questions/question_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListQuestions extends StatefulWidget {
  const ListQuestions({Key? key}) : super(key: key);

  @override
  State<ListQuestions> createState() => _ListQuestionsState();
}

class _ListQuestionsState extends State<ListQuestions> {
  final _questionsController = PageController(
      initialPage: Random().nextInt(201), viewportFraction: 0.85);
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseQuery.getQuestions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  const Text(
                    '200 вопросов по вероучению Ислама',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: _questionsController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuestionItem(
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_questionsController.hasClients) {
                            _questionsController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _questionsController,
                        count: snapshot.data!.length,
                        effect: const ScrollingDotsEffect(
                          maxVisibleDots: 11,
                          dotWidth: 4,
                          dotHeight: 12,
                          dotColor: Color(0xFFCE93D8),
                          activeDotColor: Colors.purple,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_questionsController.hasClients) {
                            _questionsController.animateToPage(
                              snapshot.data!.length - 1,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text(
                            '${snapshot.data!.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                ],
              )
            : const Center(
                child: Padding(
                  padding: MainAppStyle.mainPadding,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
      },
    );
  }
}
