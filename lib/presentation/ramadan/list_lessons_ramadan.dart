import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/presentation/ramadan/lesson_ramadan_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListLessonsRamadan extends StatefulWidget {
  const ListLessonsRamadan({Key? key}) : super(key: key);

  @override
  State<ListLessonsRamadan> createState() => _ListLessonsRamadanState();
}

class _ListLessonsRamadanState extends State<ListLessonsRamadan> {
  final _lessonsRamadanController = PageController(initialPage: Random().nextInt(50), viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text('Уроки Рамадана'),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _lessonsRamadanController,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return LessonRamadanItem(index: index);
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _lessonsRamadanController,
          count: 50,
          effect: const ScrollingDotsEffect(
            maxVisibleDots: 11,
            dotWidth: 12,
            dotHeight: 4,
            dotColor: Color(0xFF4DB6AC),
            activeDotColor: Colors.brown,
          ),
        ),
      ],
    );
  }
}
