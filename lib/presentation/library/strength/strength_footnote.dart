import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/core/styles/app_styles.dart';

import '../../../data/repositories/strength_data_repository.dart';
import '../../../domain/entities/strength_footnote_entity.dart';
import '../../../domain/usecases/strength_use_case.dart';
import '../../widgets/error_data_text.dart';

class StrengthFootnote extends StatefulWidget {
  const StrengthFootnote({
    super.key,
    required this.footnoteId,
    required this.footnoteColor,
  });

  final String footnoteId;
  final Color footnoteColor;

  @override
  State<StrengthFootnote> createState() => _StrengthFootnoteState();
}

class _StrengthFootnoteState extends State<StrengthFootnote> {
  final StrengthUseCase _strengthUseCase = StrengthUseCase(StrengthDataRepository());

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<StrengthFootnoteEntity>(
      future: _strengthUseCase.fetchFootnoteById(
        footnoteId: int.parse(widget.footnoteId),
      ),
      builder: (BuildContext context, AsyncSnapshot<StrengthFootnoteEntity> snapshot) {
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
