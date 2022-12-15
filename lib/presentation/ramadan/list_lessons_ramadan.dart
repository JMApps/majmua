import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/ramadan/lesson_ramadan_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListLessonsRamadan extends StatefulWidget {
  const ListLessonsRamadan({Key? key}) : super(key: key);

  @override
  State<ListLessonsRamadan> createState() => _ListLessonsRamadanState();
}

class _ListLessonsRamadanState extends State<ListLessonsRamadan> {
  final _lessonsRamadanController =
      PageController(initialPage: Random().nextInt(30), viewportFraction: 0.85);
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseQuery.getLessonsRamadan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  const Text(
                    'Уроки Рамадана',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_lessonsRamadanController.hasClients) {
                            _lessonsRamadanController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.brown,
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
                        controller: _lessonsRamadanController,
                        count: snapshot.data!.length,
                        effect: const ScrollingDotsEffect(
                          maxVisibleDots: 11,
                          dotWidth: 4,
                          dotHeight: 12,
                          dotColor: Color(0xFFBCAAA4),
                          activeDotColor: Colors.brown,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_lessonsRamadanController.hasClients) {
                            _lessonsRamadanController.animateToPage(
                              snapshot.data!.length - 1,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.brown,
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
                  const SizedBox(height: 32),
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
