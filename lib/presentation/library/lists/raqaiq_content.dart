import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/raqaiq_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/raqaiq_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/raqaiq_html_data.dart';

class RaqaiqContent extends StatefulWidget {
  const RaqaiqContent({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<RaqaiqContent> createState() => _RaqaiqContentState();
}

class _RaqaiqContentState extends State<RaqaiqContent> {
  late final Future<RaqaiqEntity> _futureRaqaiqs;

  @override
  void initState() {
    super.initState();
    _futureRaqaiqs = Provider.of<RaqaiqState>(context, listen: false).getRaqaiqById(raqaiqId: widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<RaqaiqEntity>(
      future: _futureRaqaiqs,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          final RaqaiqEntity model = snapshot.data!;
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
                        RaqaiqHtmlData(
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
