import 'package:flutter/material.dart';
import 'package:majmua/application/state/pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/lessons_query.dart';
import 'package:majmua/presentation/library/lessons/lesson_item.dart';
import 'package:majmua/presentation/library/lessons/lessons_smooth_indicator.dart';
import 'package:provider/provider.dart';

class LessonsRamadanPage extends StatefulWidget {
  const LessonsRamadanPage({Key? key}) : super(key: key);

  @override
  State<LessonsRamadanPage> createState() => _LessonsRamadanPageState();
}

class _LessonsRamadanPageState extends State<LessonsRamadanPage> {
  final LessonsQuery _lessonsQuery = LessonsQuery();

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
          title: const Text('Уроки Рамадана'),
        ),
        body: Consumer<PagesScrollState>(
          builder: (BuildContext context, scrollState, _) {
            return FutureBuilder(
              future: _lessonsQuery.getAllLessons(),
              builder: (BuildContext context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: scrollState.getPageController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return LessonItem(
                                  item: snapshot.data![index],
                                );
                              },
                            ),
                          ),
                          LessonsSmoothIndicator(
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
