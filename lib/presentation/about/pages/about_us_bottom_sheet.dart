import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../items/social_item.dart';

class AboutUsBottomSheet extends StatelessWidget {
  const AboutUsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final bool isAndroid = Platform.isAndroid;
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            appLocale.otherApps,
            style: AppStyles.mainTextStyleBold,
          ),
          Visibility(
            visible: !isAndroid,
            child: const SizedBox(height: 8),
          ),
          Visibility(
            visible: !isAndroid,
            child: const SocialItem(
              title: 'App Store',
              iconName: AppStringConstraints.iconAppStore,
              link: AppStringConstraints.appStoreLink,
            ),
          ),
          Visibility(
            visible: isAndroid,
            child: const SizedBox(height: 8),
          ),
          Visibility(
            visible: isAndroid,
            child: const SocialItem(
              title: 'Google Play',
              iconName: AppStringConstraints.iconGooglePlay,
              link: AppStringConstraints.googlePlayLink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            appLocale.weSocials,
            style: AppStyles.mainTextStyleBold,
          ),
          const SizedBox(height: 8),
          const SocialItem(
            title: 'Telegram',
            iconName: AppStringConstraints.iconTelegram,
            link: AppStringConstraints.telegramLink,
          ),
          const SizedBox(height: 8),
          const SocialItem(
            title: 'Instagram',
            iconName: AppStringConstraints.iconInstagram,
            link: AppStringConstraints.instagramLink,
          ),
          const SizedBox(height: 8),
          const SocialItem(
            title: 'Umma Life',
            iconName: AppStringConstraints.iconUmmaLife,
            link: AppStringConstraints.ummaLifeLink,
          ),
          const SizedBox(height: 8),
          Text(
            appLocale.rateApp,
            style: AppStyles.mainTextStyleBold,
          ),
          const SizedBox(height: 8),
          SocialItem(
            title: appLocale.appName,
            iconName: AppStringConstraints.iconStar,
            link: isAndroid ? AppStringConstraints.appLinkAndroid : AppStringConstraints.appLinkIOS,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              Navigator.pop(context);
              Share.share('${appLocale.appName}\n\n${AppStringConstraints.iOS}\n${AppStringConstraints.appLinkIOS}\n\n${AppStringConstraints.android}\n${AppStringConstraints.appLinkAndroid}', sharePositionOrigin: Rect.fromLTWH(0, 0, screenWidth, screenHeight / 2));
            },
            label: Text(
              appLocale.share,
              style: AppStyles.mainTextStyle,
            ),
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.ios_share),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
