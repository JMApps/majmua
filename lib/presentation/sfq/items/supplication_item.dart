import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                supplicationModel.ayahArabic,
                style: TextStyle(
                  fontSize: 22.0,
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
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: AppStringConstraints.fontGilroyMedium,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                supplicationModel.ayahSource,
                style: const TextStyle(
                  fontSize: 15.0,
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
          ),
        ),
      ),
    );
  }
}
