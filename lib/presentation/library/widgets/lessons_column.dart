import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/lessons_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/lessons_state.dart';
import '../../widgets/app_error_text.dart';
import 'lessons_html_data.dart';

class LessonsColumn extends StatefulWidget {
  const LessonsColumn({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<LessonsColumn> createState() => _LessonsColumnState();
}

class _LessonsColumnState extends State<LessonsColumn> {
  late final Future<LessonsEntity> _futureLessons;

  @override
  void initState() {
    super.initState();
    _futureLessons = Provider.of<LessonsState>(context, listen: false).getLessonById(lessonId: widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<LessonsEntity>(
      future: _futureLessons,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          final LessonsEntity model = snapshot.data!;
          return SingleChildScrollView(
            padding: AppStyles.mainMardingMini,
            child: Consumer<BookSettingsState>(
              builder: (context, settings, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: appColors.secondary.withAlpha(35),
                      elevation: 0,
                      child: Padding(
                        padding: AppStyles.mainMarding,
                        child: Text(
                          '${model.id} – ${model.lessonTitle}',
                          style: TextStyle(
                            fontSize: settings.textSize,
                            fontFamily: AppStringConstraints.fontGilroyMedium,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    LessonsHtmlData(
                      htmlData: model.lessonContent,
                      footnoteColor: appColors.primary,
                      font: AppStringConstraints.fontGilroy,
                      fontSize: settings.textSize,
                      textAlign: TextAlign.justify,
                      fontColor: appColors.onSurface,
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
