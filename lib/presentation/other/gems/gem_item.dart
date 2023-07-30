import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/gems_model.dart';
import 'package:majmua/presentation/widgets/copy_share_card.dart';
import 'package:provider/provider.dart';

class GemItem extends StatelessWidget {
  const GemItem({Key? key, required this.item}) : super(key: key);

  final GemsModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
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
                  Html(data: item.content, style: {
                    '#': Style(
                      color: appColors.mainTextColor,
                      fontSize: FontSize(settingsState.getFontSize),
                      fontFamily: 'Nexa',
                      textAlign: TextAlign.center,
                    )
                  }),
                  const SizedBox(height: 16),
                  CircleAvatar(
                    backgroundColor: appColors.secondAppColor,
                    radius: 20,
                    child: Text(
                      item.id.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (_) => CopyShareCard(
                          content: '${item.contentForShare}\n\nШейх ‘Абду-ль-‘Азиз ат-Тарифи, да сохранит его Аллах',
                        ),
                      );
                    },
                    icon: const Icon(CupertinoIcons.share),
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
