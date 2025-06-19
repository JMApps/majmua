import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/fortress_entity.dart';
import '../../state/fortress_state.dart';
import '../widgets/fortress_counter_button.dart';
import '../widgets/fortress_html_data.dart';
import '../widgets/supplication_media_card.dart';

class FortressSupplicationItem extends StatelessWidget {
  const FortressSupplicationItem({
    super.key,
    required this.fortressModel,
    required this.index,
    required this.supplicationsCount,
  });

  final FortressEntity fortressModel;
  final int index;
  final int supplicationsCount;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingWithoutTopMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<FortressState>(
          builder: (context, fortressState, _) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
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
                    fortressModel.countNumber > 0 ? FortressCounterButton(count: fortressModel.countNumber) : SizedBox(),
                    SizedBox(height: fortressModel.countNumber > 0 ? 16 : 0),
                    fortressModel.transcriptionText != null && fortressModel.transcriptionText!.isNotEmpty && fortressState.transcriptionIsShow ? Text(
                      fortressModel.transcriptionText!,
                      style: TextStyle(
                        fontSize: fortressState.translationTextSize,
                      ),
                      textAlign: TextAlign.center,
                    ) : const SizedBox(),
                    SizedBox(height: fortressModel.transcriptionText != null && fortressModel.transcriptionText!.isNotEmpty  && fortressState.transcriptionIsShow ? 16 : 0),
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
                      supplicationLength: supplicationsCount,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
