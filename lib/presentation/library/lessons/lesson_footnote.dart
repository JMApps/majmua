import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/repositories/questions_data_repository.dart';
import 'package:majmua/domain/entities/question_footnote_entity.dart';
import 'package:majmua/domain/usecases/questions_use_case.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';

class LessonFootnote extends StatelessWidget {
  const LessonFootnote({
    super.key,
    required this.footnoteContent,
    required this.footnoteColor,
  });

  final String footnoteContent;
  final Color footnoteColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: footnoteColor,
            child: Text(
              '000',
              style: TextStyle(
                fontSize: 15,
                color: appColors.surface,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Html(
            data: footnoteContent,
            style: {
              '#': Style(
                padding: HtmlPaddings.zero,
                margin: Margins.zero,
                fontSize: FontSize(18),
                color: appColors.inverseSurface,
                textAlign: TextAlign.center,
              ),
              'b': Style(
                padding: HtmlPaddings.zero,
                margin: Margins.zero,
                fontSize: FontSize(18),
                fontWeight: FontWeight.bold,
                color: appColors.inverseSurface,
              ),
              'small': Style(
                padding: HtmlPaddings.zero,
                margin: Margins.zero,
                fontSize: FontSize(12),
                color: appColors.inverseSurface,
              ),
            },
          ),
        ],
      ),
    );
  }
}
