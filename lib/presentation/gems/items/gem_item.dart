import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/gem_entity.dart';
import '../../state/gems_state.dart';

class GemItem extends StatelessWidget {
  const GemItem({
    super.key,
    required this.gemModel,
    required this.index,
  });

  final GemEntity gemModel;
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
              Consumer<GemsState>(
                builder: (context, gemsState, _) {
                  return Html(
                    data: gemModel.citation,
                    style: {
                      '#': Style(
                        fontSize: FontSize(gemsState.textSize),
                        fontFamily: AppStringConstraints.fontGilroy,
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        textAlign: TextAlign.center,
                      )
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: appColors.secondaryContainer,
                child: Padding(
                  padding: AppStyles.mardingTopMicroMini,
                  child: Text(
                    gemModel.id.toString(),
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
