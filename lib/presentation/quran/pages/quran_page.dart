import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/surah_settings_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/surah_settings_bottom_sheet.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({
    super.key,
    required this.surahName,
    required this.listPages,
  });

  final String surahName;
  final List<String> listPages;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  Future<String> _cacheImage(String assetName) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/$assetName.png';

    final file = File(filePath);

    if (!await file.exists()) {
      try {
        ByteData data = await rootBundle.load('assets/quran/$assetName.png');
        List<int> bytes = data.buffer.asUint8List();
        await file.writeAsBytes(bytes);
      } catch (e) {
        return '$e';
      }
    }
    return filePath;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SurahSettingsState(widget.surahName),
        ),
      ],
      child: Consumer<SurahSettingsState>(
        builder: (context, surahState, _) {
          final textContrast = surahState.getFontContrast / 100.0;
          final textColor = appColors.onSurface.withOpacity(textContrast);
          final yellowTint = Color.lerp(
            appColors.surface,
            Colors.yellow,
            brightness == Brightness.light ? surahState.getWarmthValue / 100 : surahState.getWarmthValue / 200,
          );
          return GestureDetector(
            onTap: () =>
                surahState.setAppBarIsVisible = !surahState.getAppBarIsVisible,
            child: SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                backgroundColor: yellowTint,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: surahState.getAppBarIsVisible ? 1.0 : 0.0,
                    child: AppBar(
                      backgroundColor: yellowTint,
                      title: Text(widget.surahName),
                      actions: [
                        IconButton(
                          onPressed: () {
                            surahState.getPageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn,
                            );
                          },
                          tooltip: appLocale.reset,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.replay_circle_filled_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ChangeNotifierProvider.value(
                                  value: surahState,
                                  child: const SurahSettingsBottomSheet(),
                                );
                              },
                            );
                          },
                          tooltip: appLocale.settings,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                ),
                body: PageView.builder(
                  controller: surahState.getPageController,
                  itemCount: widget.listPages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return FutureBuilder<String>(
                      future: _cacheImage(widget.listPages[index]),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return AppErrorText(text: snapshot.error.toString());
                        }
                        if (snapshot.hasData) {
                          return Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Image.file(
                                    File(snapshot.data!),
                                    fit: BoxFit.cover,
                                    color: textColor,
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    '${index + 1}',
                                    style: AppStyles.mainTextStyleMini,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                  onPageChanged: (int page) {
                    surahState.savePageNumber(page);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
