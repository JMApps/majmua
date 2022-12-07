import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/ramadan/lesson_ramadan_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListLessonsRamadan extends StatefulWidget {
  const ListLessonsRamadan({Key? key}) : super(key: key);

  @override
  State<ListLessonsRamadan> createState() => _ListLessonsRamadanState();
}

class _ListLessonsRamadanState extends State<ListLessonsRamadan> {
  final _lessonsRamadanController =
      PageController(initialPage: Random().nextInt(30), viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<MainAppState>().getDatabaseQuery.getLessonsRamadan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  const Text('Уроки Рамадана'),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 125,
                    child: PageView.builder(
                      controller: _lessonsRamadanController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LessonRamadanItem(
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  SmoothPageIndicator(
                    controller: _lessonsRamadanController,
                    count: snapshot.data!.length,
                    effect: const ScrollingDotsEffect(
                      maxVisibleDots: 11,
                      dotWidth: 12,
                      dotHeight: 4,
                      dotColor: Color(0xFF4DB6AC),
                      activeDotColor: Colors.brown,
                    ),
                  ),
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
