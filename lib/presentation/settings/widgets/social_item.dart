import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/styles/app_styles.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.title,
    required this.iconName,
    required this.link,
  });

  final String title;
  final String iconName;
  final String link;

  @override
  Widget build(BuildContext context) {
    final Uri urlLink = Uri.parse(link);
    return ListTile(
      onTap: () async {
        await launchUrl(urlLink);
      },
      visualDensity: VisualDensity.compact,
      shape: AppStyles.mainShapeMini,
      contentPadding: AppStyles.mardingHorizontal,
      leading: Image.asset(
        'assets/icons/$iconName.png',
        width: 35,
        height: 35,
      ),
      title: Text(
        title,
        style: AppStyles.mainTextStyleMini,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
