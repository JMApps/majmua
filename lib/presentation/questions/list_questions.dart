import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/questions/question_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListQuestions extends StatefulWidget {
  const ListQuestions({Key? key}) : super(key: key);

  @override
  State<ListQuestions> createState() => _ListQuestionsState();
}

class _ListQuestionsState extends State<ListQuestions> {
  final _questionsController = PageController(
      initialPage: Random().nextInt(201), viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<MainAppState>().getDatabaseQuery.getQuestions(),
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
