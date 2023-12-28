import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/enums/app_theme.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../state/app_settings_state.dart';
import '../widgets/user_back_button.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.settings),
      ),
      body: Consumer<AppSettingsState>(
        builder: (BuildContext context, AppSettingsState settings, _) {
          return SingleChildScrollView(
            padding: AppStyles.mainMardingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  appLocale.appTheme,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                CupertinoSlidingSegmentedControl(
                  groupValue: settings.getCurrentTheme,
                  padding: AppStyles.mainMardingMicro,
                  thumbColor: appColors.glass,
                  children: <AppTheme, Widget>{
                    AppTheme.light: Text(appLocale.light),
                    AppTheme.dark: Text(appLocale.dark),
                    AppTheme.adaptive: Text(appLocale.system),
                  },
                  onValueChanged: (AppTheme? value) {
                    settings.setCurrentTheme = value!;
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  appLocale.wallpapersMainScreen,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                SizedBox(
                  height: screenHeight * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppStrings.backgroundPictureNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          settings.setBackgroundPictureIndex = index;
                        },
                        borderRadius: AppStyles.mainBorderRadiusMini,
                        child: Container(
                          width: screenWidth * 0.25,
                          padding: EdgeInsets.zero,
                          margin: AppStyles.mardingHorizontalMicro,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: AppStyles.mainBorderRadiusMini,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/pictures/${AppStrings.backgroundPictureNames[index]}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: settings.getBackgroundPictureIndex == index
                              ? CircleAvatar(
                                  radius: screenWidth * 0.05,
                                  backgroundColor: appColors.primary.withOpacity(0.5),
                                  child: Icon(
                                    CupertinoIcons.checkmark_circle,
                                    color: appColors.surface,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  appLocale.display,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                SwitchListTile.adaptive(
                  title: Text(appLocale.alwaysOnDisplay),
                  value: settings.getAlwaysDisplay,
                  contentPadding: AppStyles.mardingHorizontalMini,
                  shape: AppStyles.mainShapeMini,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  activeColor: appColors.quaternaryColor,
                  onChanged: (bool onChanged) {
                    settings.setAlwaysDisplay = onChanged;
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  appLocale.apps,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                Platform.isIOS
                    ? ListTile(
                        onTap: () {
                          _launchUrl(
                              link: 'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953');
                        },
                        title: Text(appLocale.otherApp),
                        leading: Image.asset('assets/icons/appstore.png'),
                        trailing: Image.asset(
                          'assets/icons/angle-right.png',
                          width: 20,
                          height: 20,
                          color: appColors.primary,
                        ),
                        contentPadding: AppStyles.mardingHorizontalMini,
                        shape: AppStyles.mainShapeMini,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      )
                    : ListTile(
                        onTap: () {
                          _launchUrl(
                              link: 'https://play.google.com/store/apps/dev?id=8649252597553656018');
                        },
                        title: Text(appLocale.otherApp),
                        leading: Image.asset('assets/icons/google-play.png'),
                        trailing: Image.asset(
                          'assets/icons/angle-right.png',
                          width: 20,
                          height: 20,
                          color: appColors.primary,
                        ),
                        contentPadding: AppStyles.mardingHorizontalMini,
                        shape: AppStyles.mainShapeMini,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                      ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  appLocale.contacts,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                ListTile(
                  onTap: () {
                    _launchUrl(link: 'https://ummalife.com/jmapps');
                  },
                  title: const Text('Umma Life'),
                  leading: Image.asset('assets/icons/ummalife.png'),
                  trailing: Image.asset(
                    'assets/icons/angle-right.png',
                    width: 20,
                    height: 20,
                    color: appColors.primary,
                  ),
                  contentPadding: AppStyles.mardingHorizontalMini,
                  shape: AppStyles.mainShapeMini,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                ),
                const Divider(indent: 16, endIndent: 16),
                ListTile(
                  onTap: () {
                    _launchUrl(link: 'https://instagram.com/dev_muslim');
                  },
                  title: const Text('Instagram'),
                  leading: Image.asset('assets/icons/instagram.png'),
                  trailing: Image.asset(
                    'assets/icons/angle-right.png',
                    width: 20,
                    height: 20,
                    color: appColors.primary,
                  ),
                  contentPadding: AppStyles.mardingHorizontalMini,
                  shape: AppStyles.mainShapeMini,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                ),
                const Divider(indent: 16, endIndent: 16),
                ListTile(
                  onTap: () {
                    _launchUrl(link: 'https://t.me/jmapps');
                  },
                  title: const Text('Telegram'),
                  leading: Image.asset('assets/icons/telegram.png'),
                  trailing: Image.asset(
                    'assets/icons/angle-right.png',
                    width: 20,
                    height: 20,
                    color: appColors.primary,
                  ),
                  contentPadding: AppStyles.mardingHorizontalMini,
                  shape: AppStyles.mainShapeMini,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                ),
                const Divider(indent: 16, endIndent: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchUrl({required String link}) async {
    final Uri urlLink = Uri.parse(link);
    await launchUrl(urlLink);
  }
}
