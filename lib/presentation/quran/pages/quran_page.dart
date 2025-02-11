import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/surah_settings_state.dart';
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
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  Future<String> _cacheImage(String assetName) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/$assetName.png';

    final file = File(filePath);
    if (!await file.exists()) {
      ByteData data = await rootBundle.load('assets/quran/$assetName.png');
      List<int> bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes);
    }

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SurahSettingsState(),
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
            onTap: () => surahState.setAppBarIsVisible = !surahState.getAppBarIsVisible,
            child: Scaffold(
              backgroundColor: yellowTint,
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, surahState.getAppBarIsVisible ? 60 : 0),
                child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  top: surahState.getAppBarIsVisible ? 0 : -kToolbarHeight * 2,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text(widget.surahName),
                    actions: [
                      IconButton(
                        onPressed: () {
                          _controller.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeIn,
                          );
                        },
                        icon: const Icon(Icons.refresh_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) =>
                                SurahSettingsBottomSheet(
                              surahState: surahState,
                            ),
                          );
                        },
                        icon: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ),
              body: PageView.builder(
                controller: _controller,
                itemCount: widget.listPages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return FutureBuilder<String>(
                    future: _cacheImage(widget.listPages[index]),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Icon(Icons.error));
                      }
                      if (snapshot.hasData) {
                        return Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset(
                                  snapshot.data!,
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
                  // Save page
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
