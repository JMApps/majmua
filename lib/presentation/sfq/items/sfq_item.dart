import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/sfq_entity.dart';
import '../../state/sfq_state.dart';

class SFQItem extends StatelessWidget {
  const SFQItem({
    super.key,
    required this.supplicationModel,
    required this.index,
  });

  final SFQEntity supplicationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
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
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    supplicationModel.ayahSource,
                    style: TextStyle(
                      fontSize: sfqState.translationTextSize - 4.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundColor: appColors.secondaryContainer,
                        child: Padding(
                          padding: AppStyles.mardingTopMicroMini,
                          child: Text(
                            supplicationModel.id.toString(),
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          SharePlus.instance.share(
                            ShareParams(text: '${supplicationModel.ayahArabic}\n\n${_parseString(htmlText: supplicationModel.ayahTranslation)}\n\n${supplicationModel.ayahSource}', sharePositionOrigin: Rect.fromLTWH(0, 0, screenWidth, screenHeight / 2)),
                          );
                        },
                        icon: Icon(Icons.ios_share_rounded),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  String _parseString({required String htmlText}) {
    final document = html_parser.parse(htmlText);
    return document.body!.text;
  }
}
