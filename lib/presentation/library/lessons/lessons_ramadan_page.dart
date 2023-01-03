import 'package:flutter/material.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/application/state/book_pages_scroll_state.dart';
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
        ChangeNotifierProvider<BookPagesScrollState>(
          create: (_) => BookPagesScrollState(keyForSettingsInitialization: AppConstants.keyLessonsLastPage),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Уроки Рамадана'),
        ),
        body: Consumer<BookPagesScrollState>(
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
                              onPageChanged: (page) {
                                scrollState.changePageForLast(currentPage: page);
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
