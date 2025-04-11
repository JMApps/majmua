import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/hadith_state.dart';
import '../../widgets/app_error_text.dart';
import 'hadiths_html_data.dart';

class HadithColumn extends StatefulWidget {
  const HadithColumn({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<HadithColumn> createState() => _HadithColumnState();
}

class _HadithColumnState extends State<HadithColumn> {
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
          return SingleChildScrollView(
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
                          '${model.id} – ${model.hadithTitle}',
                          style: TextStyle(
                            fontSize: settings.textSize,
                            fontFamily: AppStringConstraints.fontGilroyMedium,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ),
                    ),
                    const SizedBox(height: 16),
                    HadithsHtmlData(
                      htmlData: model.hadithArabic,
                      footnoteColor: appColors.primary,
                      font: AppStringConstraints.fontHafs,
                      fontSize: settings.textSize + 3.0,
                      textAlign: TextAlign.center,
                      fontColor: appColors.onSurface,
                    ),
                    const SizedBox(height: 16),
                    HadithsHtmlData(
                      htmlData: model.hadithTranslation,
                      footnoteColor: appColors.primary,
                      font: AppStringConstraints.fontGilroy,
                      fontSize: settings.textSize,
                      textAlign: TextAlign.center,
                      fontColor: appColors.onSurface,
                    ),
                  ],
                );
              },
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
