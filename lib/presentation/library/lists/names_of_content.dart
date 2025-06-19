import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/names_of_ayah_entity.dart';
import '../../../domain/entities/names_of_content_entity.dart';
import '../../../domain/entities/names_of_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/names_of_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/names_html_data.dart';

class NamesOfContent extends StatefulWidget {
  const NamesOfContent({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<NamesOfContent> createState() => _NamesOfContentState();
}

class _NamesOfContentState extends State<NamesOfContent> {
  late final Future<List<NamesOfEntity>> _futureNames;
  late final Future<List<NamesOfAyahEntity>> _futureAyahs;
  late final Future<NamesOfContentEntity> _futureContent;

  @override
  void initState() {
    super.initState();
    _futureNames = Provider.of<NamesOfState>(context, listen: false).getNameByChapterId(contentId: widget.pageIndex);
    _futureAyahs = Provider.of<NamesOfState>(context, listen: false).getAyahByChapterId(contentId: widget.pageIndex);
    _futureContent = Provider.of<NamesOfState>(context, listen: false).getContentById(contentId: widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return SelectableRegion(
      selectionControls: Platform.isAndroid ? MaterialTextSelectionControls() : CupertinoTextSelectionControls(),
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: AppStyles.mainMardingMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<List<NamesOfEntity>>(
                future: _futureNames,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Navigator.pop(context);
                    return AppErrorText(text: snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final NamesOfEntity model = snapshot.data![index];
                        return Card(
                          margin: AppStyles.mardingBottomMini,
                          child: Padding(
                            padding: AppStyles.mainMarding,
                            child: Consumer<BookSettingsState>(
                              builder: (context, settings, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      model.nameArabic,
                                      style: TextStyle(
                                        fontSize: settings.textSize + 3.0,
                                        fontFamily: AppStringConstraints.fontHafs,
                                        color: appColors.primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      model.nameTranscription,
                                      style: TextStyle(
                                        fontSize: settings.textSize,
                                        color: appColors.secondary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      model.nameTranslation,
                                      style: TextStyle(
                                        fontSize: settings.textSize,
                                        color: appColors.tertiary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              FutureBuilder<List<NamesOfAyahEntity>>(
                future: _futureAyahs,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Navigator.pop(context);
                    return AppErrorText(text: snapshot.error.toString());
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final NamesOfAyahEntity model = snapshot.data![index];
                        return Card(
                          margin: AppStyles.mardingBottomMini,
                          elevation: 0,
                          color: appColors.primary.withAlpha(25),
                          child: Padding(
                            padding: AppStyles.mainMarding,
                            child: Consumer<BookSettingsState>(
                              builder: (context, settings, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      model.ayahArabic,
                                      style: TextStyle(
                                        fontSize: settings.textSize + 3.0,
                                        fontFamily: AppStringConstraints.fontHafs,
                                        color: appColors.primary,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      model.ayahTranslation,
                                      style: TextStyle(
                                        fontSize: settings.textSize,
                                        color: appColors.tertiary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      model.ayahSource,
                                      style: TextStyle(
                                        fontSize: settings.textSize - 6.0,
                                        color: appColors.secondary,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              FutureBuilder<NamesOfContentEntity>(
                future: _futureContent,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Navigator.pop(context);
                    return AppErrorText(text: snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    final NamesOfContentEntity model = snapshot.data!;
                    return Consumer<BookSettingsState>(
                      builder: (context, settings, _) {
                        return NamesHtmlData(
                          htmlData: model.clarificationContent,
                          footnoteColor: appColors.primary,
                          font: AppStringConstraints.fontGilroy,
                          fontSize: settings.textSize,
                          textAlign: AppStyles.fontAligns[settings.textAlignIndex],
                          fontColor: appColors.onSurface,
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
