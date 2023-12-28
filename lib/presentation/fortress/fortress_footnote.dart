import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/styles/app_styles.dart';
import '../../data/repositories/fortress_data_repository.dart';
import '../../domain/entities/footnote_fortress_entity.dart';
import '../../domain/usecases/fortress_use_case.dart';
import '../widgets/error_data_text.dart';

class FortressFootnote extends StatefulWidget {
  const FortressFootnote({
    super.key,
    required this.footnoteId,
    required this.footnoteColor,
  });

  final String footnoteId;
  final Color footnoteColor;

  @override
  State<FortressFootnote> createState() => _FortressFootnoteState();
}

class _FortressFootnoteState extends State<FortressFootnote> {
  final FortressUseCase _fortressUseCase = FortressUseCase(FortressDataRepository());

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return FutureBuilder<FootnoteFortressEntity>(
      future: _fortressUseCase.fetchFootnoteById(
        tableName: appLocale!.tableOfFootnotes,
        footnoteId: int.parse(widget.footnoteId),
      ),
      builder: (BuildContext context,
          AsyncSnapshot<FootnoteFortressEntity> snapshot) {
        return snapshot.hasData
            ? SingleChildScrollView(
                padding: AppStyles.mardingWithoutTop,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: widget.footnoteColor,
                      child: Text(
                        snapshot.data!.id.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: appColors.surface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Html(
                      data: snapshot.data!.footnote,
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
              )
            : Center(
                child: ErrorDataText(
                  errorText: snapshot.error.toString(),
                ),
              );
      },
    );
  }
}
