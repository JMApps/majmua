import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/strength_footnote_entity.dart';
import '../../state/library/strength_state.dart';
import '../../widgets/app_error_text.dart';
import 'questions_html_data.dart';
class StrengthFootnoteData extends StatelessWidget {
  const StrengthFootnoteData({
    super.key,
    required this.footnoteNumber,
    required this.footnoteColor,
  });

  final int footnoteNumber;
  final Color footnoteColor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StrengthFootnoteEntity>(
      future: Provider.of<StrengthState>(context, listen: false).getFootnoteById(footnoteId: footnoteNumber),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          final StrengthFootnoteEntity model = snapshot.data!;
          return SingleChildScrollView(
            padding: AppStyles.mardingWithoutTop,
            child: QuestionsHtmlData(
              htmlData: '<b>[${model.footnoteId}]</b> – ${model.footnote}',
              footnoteColor: footnoteColor,
              font: AppStringConstraints.fontGilroy,
              fontSize: 18.0,
              textAlign: TextAlign.center,
              fontColor: Theme.of(context).colorScheme.onSurface,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
