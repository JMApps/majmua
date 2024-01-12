import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:share_plus/share_plus.dart';

class TextShareButton extends StatelessWidget {
  const TextShareButton({
    super.key,
    required this.contentForShare,
  });

  final String contentForShare;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: appColors.fullGlass,
          builder: (context) => Padding(
            padding: AppStyles.mardingWithoutTop,
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                Share.share(
                  contentForShare,
                  sharePositionOrigin: const Rect.fromLTWH(1, 1, 1, 2 / 2),
                );
              },
              tileColor: appColors.primary.withOpacity(0.25),
              title: Text(appLocale!.share),
              trailing: Image.asset(
                'assets/icons/share.png',
                width: 25,
                height: 25,
                color: appColors.primary,
              ),
            ),
          ),
        );
      },
      icon: Image.asset(
        'assets/icons/share.png',
        width: 25,
        height: 25,
        color: appColors.primary,
      ),
    );
  }
}
