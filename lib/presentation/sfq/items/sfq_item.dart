import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../state/sfq_state.dart';

class SFQItem extends StatelessWidget {
  const SFQItem({
    super.key,
    required this.supplicationModel,
    required this.index,
  });

  final SupplicationEntity supplicationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingBottomMini,
      child: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainMarding,
          child: Consumer<SFQState>(
            builder: (context, sfqState, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    supplicationModel.ayahArabic,
                    style: TextStyle(
                      fontSize: sfqState.arabicTextSize,
                      color: appColors.primary,
                      fontFamily: AppStringConstraints.fontHafs,
                      height: 1.75,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    supplicationModel.ayahTranslation,
                    style: TextStyle(
                      fontSize: sfqState.translationTextSize,
                      fontFamily: AppStringConstraints.fontGilroyMedium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    supplicationModel.ayahSource,
                    style: TextStyle(
                      fontSize: sfqState.translationTextSize - 4.0,
                      fontFamily: AppStringConstraints.fontGilroy,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  CircleAvatar(
                    radius: 15.0,
                    backgroundColor: appColors.secondaryContainer,
                    child: Padding(
                      padding: AppStyles.mardingTopMicroMini,
                      child: Text(
                        supplicationModel.id.toString(),
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: AppStringConstraints.fontGilroyMedium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
