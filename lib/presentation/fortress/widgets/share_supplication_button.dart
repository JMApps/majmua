import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/fortress_footnotes_state.dart';

class ShareSupplicationButton extends StatefulWidget {
  const ShareSupplicationButton({
    super.key,
    required this.supplicationId,
    required this.dataSupplication,
  });

  final int supplicationId;
  final String dataSupplication;

  @override
  State<ShareSupplicationButton> createState() => _ShareSupplicationButtonState();
}

class _ShareSupplicationButtonState extends State<ShareSupplicationButton> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return Padding(
            padding: AppStyles.mardingWithoutTop,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.pop(context);
                    final String footnoteSupplication = await _footnoteSupplication(tableName: appLocale.fortressFootnoteTableName);
                    await SharePlus.instance.share(
                      ShareParams(text: footnoteSupplication.isNotEmpty ? '${widget.dataSupplication}\n\n$footnoteSupplication' : widget.dataSupplication),
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.share,
                    color: appColors.primary,
                  ),
                  label: Text(
                    appLocale.share,
                    style: AppStyles.mainTextStyleMini,
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.pop(context);
                    final String footnoteSupplication = await _footnoteSupplication(tableName: appLocale.fortressFootnoteTableName);
                    await Clipboard.setData(ClipboardData(text: footnoteSupplication.isNotEmpty ? '${widget.dataSupplication}\n\n$footnoteSupplication' : widget.dataSupplication)).then(
                      (_) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: appColors.secondaryContainer,
                            duration: const Duration(milliseconds: 500),
                            shape: AppStyles.mainShapeMini,
                            elevation: 0,
                            content: Text(
                              appLocale.copied,
                              style: TextStyle(
                                fontSize: 17.0,
                                color: appColors.onSurface,
                              )
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.doc_on_doc,
                    color: appColors.primary,
                  ),
                  label: Text(
                    appLocale.copy,
                    style: AppStyles.mainTextStyleMini,
                  ),
                ),
              ],
            ),
          );
          },
        );
      },
      icon: const Icon(CupertinoIcons.share),
    );
  }

  Future<String> _footnoteSupplication({required String tableName}) async {
    final String footnoteSupplication = await Provider.of<FortressFootnotesState>(context, listen: false).getFootnoteBySupplication(tableName: tableName, supplicationId: widget.supplicationId);
    final footnoteData = html_parser.parse(footnoteSupplication);
    return footnoteData.body!.text;
  }
}
