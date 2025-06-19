import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/strength_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/strength_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/strength_html_data.dart';

class StrengthContent extends StatefulWidget {
  const StrengthContent({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<StrengthContent> createState() => _StrengthContentState();
}

class _StrengthContentState extends State<StrengthContent> {
  late final Future<StrengthEntity> _futureStrengths;

  @override
  void initState() {
    super.initState();
    _futureStrengths = Provider.of<StrengthState>(context, listen: false).getStrengthById(strengthId: widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<StrengthEntity>(
      future: _futureStrengths,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          final StrengthEntity model = snapshot.data!;
          return SelectableRegion(
            selectionControls: Platform.isAndroid ? MaterialTextSelectionControls() : CupertinoTextSelectionControls(),
            child: Scrollbar(
              child: SingleChildScrollView(
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
                              '${model.id} – ${model.chapterTitle}',
                              style: TextStyle(
                                fontSize: settings.textSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        StrengthHtmlData(
                          htmlData: model.chapterContent,
                          footnoteColor: appColors.primary,
                          font: AppStringConstraints.fontGilroy,
                          fontSize: settings.textSize,
                          textAlign: AppStyles.fontAligns[settings.textAlignIndex],
                          fontColor: appColors.onSurface,
                        ),
                      ],
                    );
                  },
                ),
              ),
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
