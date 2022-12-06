import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/presentation/questions/question_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListQuestions extends StatefulWidget {
  const ListQuestions({Key? key}) : super(key: key);

  @override
  State<ListQuestions> createState() => _ListQuestionsState();
}

class _ListQuestionsState extends State<ListQuestions> {
  final _questionsController = PageController(initialPage: Random().nextInt(201), viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text('200 вопросов по вероучению Ислама'),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _questionsController,
            itemCount: 201,
            itemBuilder: (BuildContext context, int index) {
              return QuestionItem(index: index);
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _questionsController,
          count: 201,
          effect: ScrollingDotsEffect(
            maxVisibleDots: 11,
            dotWidth: 12,
            dotHeight: 4,
            dotColor: Colors.teal.shade300,
            activeDotColor: Colors.purple,
          ),
        ),
      ],
    );
  }
}
