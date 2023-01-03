import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppLinksButton extends StatelessWidget {
  const ShareAppLinksButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Share.share('Рекомендую скачать приложение "Полка мусульманина":\n\nВерсия для iOS:\nhttps://apps.apple.com/tr/app/полка-мусульманина/id1659190395\n\nВерсия для Android\nhttps://play.google.com/store/apps/details?id=jmapps.project.majmua',
            sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10));
      },
      splashRadius: 20,
      icon: const Icon(
        Icons.ios_share_rounded,
      ),
    );
  }
}
