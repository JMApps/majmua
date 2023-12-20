import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/surah_settings_state.dart';
import 'package:majmua/presentation/supplicationsAndQuran/surah/sliding_app_bar.dart';
import 'package:majmua/presentation/supplicationsAndQuran/surah/surah_settings.dart';
import 'package:provider/provider.dart';

class SurahsPage extends StatefulWidget {
  const SurahsPage({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  final int surahNumber;
  final String surahName;

  @override
  State<SurahsPage> createState() => _SurahsPageState();
}

class _SurahsPageState extends State<SurahsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
            surahSettings.setAppBarIsVisible = !surahSettings.getAppBarIsVisible;
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
                          title: Text(widget.surahName),
                          actions: [
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
                              icon: const Icon(CupertinoIcons.settings),
                            ),
                          ],
                        )
                      : const PreferredSize(
                          preferredSize: Size(0, 0),
                          child: SizedBox(),
                        ),
                ),
                body: PageView.builder(
                  reverse: true,
                  itemCount: AppStrings.surahsLists[widget.surahNumber].length,
                  itemBuilder: (BuildContext context, int index) {
                    final String surahPage = AppStrings.surahsLists[widget.surahNumber][index];
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/quran/$surahPage.png',
                              fit: BoxFit.cover,
                              color: appColors.inverseSurface.withOpacity(surahSettings.getFontContrast / 100),
                            ),
                            const SizedBox(height: 8),
                            Text('${index + 1}'),
                          ],
                        ),
                      ),
                    );
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
