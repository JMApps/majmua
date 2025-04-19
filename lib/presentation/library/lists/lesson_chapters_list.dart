import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/lessons_entity.dart';
import '../../state/library/lessons_state.dart';
import '../../widgets/app_error_text.dart';

class LessonChaptersList extends StatelessWidget {
  const LessonChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.primary.withAlpha(20);
    final itemEvenColor = appColors.primary.withAlpha(10);
    return Consumer<LessonsState>(
      builder: (context, lessonsState, _) {
        return IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ChangeNotifierProvider.value(
                  value: lessonsState,
                  child: FutureBuilder<List<LessonsEntity>>(
                    future: lessonsState.getAllLessons(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AppErrorText(text: snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        return Scrollbar(
                          child: ListView.builder(
                            padding: AppStyles.mardingHorizontalMini,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final LessonsEntity model = snapshot.data![index];
                              return Container(
                                margin: AppStyles.mardingBottomMini,
                                decoration: BoxDecoration(
                                  borderRadius: AppStyles.mainBorder,
                                  color: index.isOdd ? itemOddColor : itemEvenColor,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    lessonsState.pageIndex = index;
                                    lessonsState.pageController.animateToPage(lessonsState.pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    model.lessonNumber,
                                    style: AppStyles.mainTextStyleMiniBold,
                                  ),
                                  subtitle: Text(
                                    model.lessonTitle,
                                    style: AppStyles.mainTextStyleMini,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.format_list_numbered),
        );
      },
    );
  }
}
