import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/hadith_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/hadiths_html_data.dart';

class HadithContent extends StatefulWidget {
  const HadithContent({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<HadithContent> createState() => _HadithContentState();
}

class _HadithContentState extends State<HadithContent> {
  late final Future<HadithEntity> _futureHadiths;

  @override
  void initState() {
    super.initState();
    _futureHadiths = Provider.of<HadithsState>(context, listen: false).getHadithById(hadithId: widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<HadithEntity>(
      future: _futureHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          final HadithEntity model = snapshot.data!;
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
                              '${model.hadithNumber.toUpperCase()}\n${model.hadithTitle}',
                              style: TextStyle(
                                fontSize: settings.textSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        HadithsHtmlData(
                          htmlData: model.hadithArabic,
                          footnoteColor: appColors.primary,
                          font: AppStringConstraints.fontHafs,
                          fontSize: settings.textSize + 3.0,
                          textAlign: AppStyles.fontAligns[settings.textAlignIndex],
                          fontColor: appColors.onSurface,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 16),
                        HadithsHtmlData(
                          htmlData: model.hadithTranslation,
                          footnoteColor: appColors.primary,
                          font: AppStringConstraints.fontGilroy,
                          fontSize: settings.textSize,
                          textAlign: AppStyles.fontAligns[settings.textAlignIndex],
                          fontColor: appColors.onSurface,
                          textDirection: TextDirection.ltr,
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
