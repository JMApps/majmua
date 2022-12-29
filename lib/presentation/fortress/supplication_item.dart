import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/fortress_counter_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/supplication_model.dart';
import 'package:provider/provider.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({Key? key, required this.item}) : super(key: key);

  final SupplicationModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FortressCounterCounter>(
          create: (_) => FortressCounterCounter(
            item.count != null ? item.count! : 0,
          ),
        ),
      ],
      child: Card(
        elevation: 1,
        margin: AppStyles.mainMarginMini,
        shape: AppStyles.mainCardBorderRadius,
        child: Center(
          child: SingleChildScrollView(
            padding: AppStyles.mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.contentArabic,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Scheherazade',
                  ),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 12),
                item.contentTranscription != null
                    ? Text(
                        item.contentTranscription!,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                        textDirection: TextDirection.ltr,
                      )
                    : const SizedBox(),
                item.contentTranscription != null
                    ? const SizedBox(height: 16)
                    : const SizedBox(),
                Html(
                  data: item.contentTranslation,
                  style: {
                    '#': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: const FontSize(18),
                      textAlign: TextAlign.start,
                      direction: TextDirection.ltr,
                      fontFamily: 'Nexa',
                    ),
                    'small': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: const FontSize(12),
                    ),
                    'a': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      color: appColors.thirdAppColor,
                      fontSize: const FontSize(18),
                      fontFamily: 'Lato',
                    ),
                  },
                  onLinkTap: (String? url, RenderContext rendContext,
                      Map<String, String> attributes, element) {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        message: Html(
                          data: url,
                          style: {
                            '#': Style(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              fontSize: const FontSize(18),
                            ),
                            'small': Style(
                              color: Colors.grey,
                              fontSize: const FontSize(12),
                            ),
                          },
                        ),
                        actions: [
                          CupertinoButton(
                            child: Text(
                              'Закрыть',
                              style: TextStyle(
                                color: appColors.thirdAppColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                item.count != null
                    ? Consumer<FortressCounterCounter>(
                        builder: (BuildContext context, fortressState, _) {
                          return AnimatedSize(
                            duration: const Duration(milliseconds: 750),
                            child: Visibility(
                              visible: fortressState.getCounterButtonIsShow,
                              child: FloatingActionButton.large(
                                elevation: 0,
                                onPressed: () {
                                  fortressState.decrement();
                                },
                                child: Text(
                                  '${fortressState.getCount}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
