import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/fortress_entity.dart';
import '../../state/fortress_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/fortress_html_data.dart';
import '../widgets/supplication_media_card.dart';

class FortressContentList extends StatefulWidget {
  const FortressContentList({
    super.key,
    required this.chapterId,
    required this.fortressState,
    required this.tableName,
  });

  final int chapterId;
  final FortressState fortressState;
  final String tableName;

  @override
  State<FortressContentList> createState() => _FortressContentListState();
}

class _FortressContentListState extends State<FortressContentList> {
  late final Future<List<FortressEntity>> _futureContent;

  @override
  void initState() {
    super.initState();
    _futureContent = widget.fortressState.getSupplicationsByChapterId(
      tableName: widget.tableName,
      chapterId: widget.chapterId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<FortressEntity>>(
      future: _futureContent,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final FortressEntity fortressModel = snapshot.data![index];
              return Card(
                margin: AppStyles.mardingBottomMini,
                child: Padding(
                  padding: AppStyles.mainMardingMini,
                  child: Consumer<FortressState>(
                    builder: (context, fortressState, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          fortressModel.arabicText != null ? Text(
                            fortressModel.arabicText!,
                            style: TextStyle(
                              fontSize: fortressState.arabicTextSize,
                              fontFamily: AppStringConstraints.fontHafs,
                              height: 1.75,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ) : const SizedBox(),
                          SizedBox(height: fortressModel.arabicText != null ? 16 : 0),
                          fortressState.transcriptionIsShow ? fortressModel.transcriptionText != null ? Text(
                            fortressModel.transcriptionText!,
                            style: TextStyle(
                              fontSize: fortressState.translationTextSize,
                              fontFamily: AppStringConstraints.fontGilroy,
                              height: 1.75,
                            ),
                            textAlign: TextAlign.center,
                          ) : const SizedBox() : const SizedBox(),
                          SizedBox(height: fortressState.transcriptionIsShow ? fortressModel.transcriptionText != null ? 16 : 0 : 0),
                          FortressHtmlData(
                            htmlData: fortressModel.translationText,
                            footnoteColor: appColors.primary,
                            font: AppStringConstraints.fontGilroyMedium,
                            fontSize: fortressState.translationTextSize,
                            textAlign: TextAlign.center,
                            fontColor: appColors.onSurface,
                          ),
                          SupplicationMediaCard(
                            supplicationModel: fortressModel,
                            supplicationIndex: index + 1,
                            supplicationLength: snapshot.data!.length,
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
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
