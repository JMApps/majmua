import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/supplications_counter_state.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/supplications_model.dart';
import 'package:majmua/presentation/supplications/page/fab_supplications_count.dart';
import 'package:provider/provider.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({Key? key, required this.item}) : super(key: key);

  final SupplicationsModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SupplicationsCounterState(item.count ?? 0),
        ),
      ],
      child: Card(
        color: appColors.mainReverse,
        margin: AppWidgetStyle.mainMarginMini,
        child: Center(
          child: SingleChildScrollView(
            padding: AppWidgetStyle.mainPadding,
            child: Consumer<TextSettingsState>(
              builder: (context, settingsState, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.supplicationArabic,
                      style: TextStyle(
                        fontSize: settingsState.getFontSize + 3.0,
                        fontFamily: 'Scheherazade',
                      ),
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 8),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 750),
                      child: item.supplicationTranscription != null
                          ? settingsState.getIsTranscription
                              ? Text(
                                  item.supplicationTranscription!,
                                  style: TextStyle(
                                    fontSize: settingsState.getFontSize,
                                    color: Colors.grey.shade600,
                                  ),
                                  textDirection: TextDirection.ltr,
                                )
                              : const SizedBox()
                          : const SizedBox(),
                    ),
                    item.supplicationTranscription != null
                        ? settingsState.getIsTranscription
                            ? const SizedBox(height: 8)
                            : const SizedBox()
                        : const SizedBox(),
                    Html(
                      data: item.supplicationTranslation,
                      style: {
                        '#': Style(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          fontSize: FontSize(settingsState.getFontSize),
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
                          builder: (BuildContext context) =>
                              CupertinoActionSheet(
                            message: Html(
                              data: url,
                              style: {
                                '#': Style(
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  fontSize: FontSize(settingsState.getFontSize),
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
                                  AppString.close,
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
                        ? const FabSupplicationsCount()
                        : const SizedBox(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
