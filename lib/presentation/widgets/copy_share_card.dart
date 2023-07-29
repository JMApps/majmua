import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/widgets/snack_container.dart';
import 'package:share_plus/share_plus.dart';

class CopyShareCard extends StatelessWidget {
  const CopyShareCard({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMargin,
      color: appColors.backgroundColorQ,
      child: Padding(
        padding: AppWidgetStyle.mainPaddingMini,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ListTile(
              onTap: () {
                FlutterClipboard.copy(content);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: appColors.secondAppColor,
                    duration: const Duration(milliseconds: 750),
                    behavior: SnackBarBehavior.floating,
                    margin: AppWidgetStyle.mainMargin,
                    shape: AppWidgetStyle.mainRectangleBorder,
                    content: const SnackContainer(
                      message: AppString.copied,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              title: const Text(AppString.copy),
              trailing: const Icon(CupertinoIcons.doc_on_doc),
              visualDensity: const VisualDensity(vertical: -4),
              shape: AppWidgetStyle.mainRectangleBorder,
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Share.share(
                  content,
                  sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
                );
                Navigator.pop(context);
              },
              title: const Text(AppString.share),
              trailing: const Icon(CupertinoIcons.share),
              visualDensity: const VisualDensity(vertical: -4),
              shape: AppWidgetStyle.mainRectangleBorder,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
