import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/fortress_footnote_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/fortress_footnotes_state.dart';
import '../../widgets/app_error_text.dart';
import 'fortress_html_data.dart';

class FortressFootnoteData extends StatelessWidget {
  const FortressFootnoteData({
    super.key,
    required this.footnoteNumber,
    required this.footnoteColor,
  });

  final int footnoteNumber;
  final Color footnoteColor;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<FortressFootnotesState>(
      builder: (context, footnotesState, _) {
        return FutureBuilder<FortressFootnoteEntity>(
          future: footnotesState.getFootnoteById(tableName: appLocale.fortressFootnoteTableName, footnoteId: footnoteNumber),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.hasError) {
                return AppErrorText(text: snapshot.error.toString());
              }
              return SingleChildScrollView(
                padding: AppStyles.mardingWithoutTop,
                child: FortressHtmlData(
                  htmlData: '<b>[${snapshot.data!.footnoteId}]</b> – ${snapshot.data!.footnote}',
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
      },
    );
  }
}
