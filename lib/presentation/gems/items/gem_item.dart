import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:share_plus/share_plus.dart';

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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final String shaikhName = 'Шейх \'Абду-ль-\'Азиз ат-Тарифи';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: appColors.secondaryContainer,
                    child: Padding(
                      padding: AppStyles.mardingTopMicroMini,
                      child: Text(
                        gemModel.id.toString(),
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
                        ShareParams(text: '${_parseString(htmlText: gemModel.citation)}\n\n$shaikhName',
                            sharePositionOrigin: Rect.fromLTWH(0, 0, screenWidth, screenHeight / 2),
                        ),
                      );
                    },
                    icon: Icon(Icons.ios_share_rounded),
                  ),
                ],
              ),
            ],
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
