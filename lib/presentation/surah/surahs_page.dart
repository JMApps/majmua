import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/strings/app_strings.dart';
import '../state/surah_settings_state.dart';
import '../widgets/user_back_button.dart';
import 'sliding_app_bar.dart';
import 'surah_settings.dart';

class SurahsPage extends StatefulWidget {
  const SurahsPage({
    super.key,
    required this.surahNumber,
    required this.surahName,
    required this.surahKey,
  });

  final int surahNumber;
  final String surahName;
  final String surahKey;

  @override
  State<SurahsPage> createState() => _SurahsPageState();
}

class _SurahsPageState extends State<SurahsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);
  late final PageController _surahPageController;
  late final int _lastPage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _lastPage = _mainSettingsBox.get(widget.surahKey, defaultValue: 0);
    _surahPageController = PageController(initialPage: _lastPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    _surahPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<SurahSettingsState>(
      builder: (BuildContext context, SurahSettingsState surahSettings, _) {
        return GestureDetector(
          onTap: () {
            surahSettings.setAppBarIsVisible =
                !surahSettings.getAppBarIsVisible;
          },
          child: Container(
            color: appColors.fullGlass,
            child: SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                backgroundColor: Colors.yellow.withOpacity(
                  Theme.of(context).brightness == Brightness.light
                      ? surahSettings.getWarmthValue / 100
                      : surahSettings.getWarmthValue / 300,
                ),
                extendBody: true,
                appBar: SlidingAppBar(
                  controller: _controller,
                  visible: surahSettings.getAppBarIsVisible,
                  child: surahSettings.getAppBarIsVisible
                      ? AppBar(
                          leading: const UserBackButton(),
                          title: Text(widget.surahName),
                          actions: [
                            IconButton(
                              onPressed: () {
                                _mainSettingsBox.put(widget.surahKey, 0);
                                _surahPageController.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 350),
                                  curve: Curves.linear,
                                );
                              },
                              icon: const Icon(
                                CupertinoIcons.arrow_counterclockwise,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: appColors.surface,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return const SurahSettings();
                                  },
                                );
                              },
                              splashRadius: 20,
                              tooltip: appLocale!.settings,
                              icon: Image.asset(
                                'assets/icons/setting.png',
                                width: 25,
                                height: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : const PreferredSize(
                          preferredSize: Size(0, 0),
                          child: SizedBox(),
                        ),
                ),
                body: PageView.builder(
                  controller: _surahPageController,
                  reverse: true,
                  itemCount: AppStrings.surahsLists[widget.surahNumber].length,
                  itemBuilder: (BuildContext context, int index) {
                    final String surahPage =
                        AppStrings.surahsLists[widget.surahNumber][index];
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/quran/$surahPage.png',
                              fit: BoxFit.cover,
                              color: appColors.inverseSurface.withOpacity(
                                surahSettings.getFontContrast / 100,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('${index + 1}'),
                          ],
                        ),
                      ),
                    );
                  },
                  onPageChanged: (int page) {
                    _mainSettingsBox.put(widget.surahKey, page);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
