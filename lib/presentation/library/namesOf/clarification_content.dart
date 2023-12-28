import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/clarification_entity.dart';
import '../../fortress/for_html_text.dart';
import '../../state/book_settings_state.dart';
import '../../widgets/error_data_text.dart';

class ClarificationContent extends StatelessWidget {
  const ClarificationContent({
    super.key,
    required this.fetchClarificationById,
  });

  final Future<ClarificationEntity> fetchClarificationById;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<ClarificationEntity>(
      future: fetchClarificationById,
      builder: (BuildContext context, AsyncSnapshot<ClarificationEntity> chapterSnapshot) {
        if (chapterSnapshot.hasData) {
          final ClarificationEntity model = chapterSnapshot.data!;
          return Consumer<BookSettingsState>(
            builder: (BuildContext context, BookSettingsState bookSettingsState, _) {
              return ForHtmlText(
                textData: model.clarificationContent,
                textSize: bookSettingsState.getTextSize.toDouble(),
                textColor: appColors.inverseSurface,
                fontFamily: 'Gilroy',
                footnoteColor: appColors.quaternaryColor,
                textDataAlign: TextAlign.start,
              );
            },
          );
        } else if (chapterSnapshot.hasError) {
          return ErrorDataText(errorText: chapterSnapshot.error.toString());
        } else {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
