import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/gems_data_repository.dart';
import '../../../data/services/databases/gems_database_service.dart';
import '../../../domain/usecases/gems_use_case.dart';
import '../../state/gems_state.dart';
import '../lists/gem_list.dart';

class GemsPage extends StatefulWidget {
  const GemsPage({super.key});

  @override
  State<GemsPage> createState() => _GemsPageState();
}

class _GemsPageState extends State<GemsPage> {
  final GemsDatabaseService _databaseService = GemsDatabaseService();
  late final GemsUseCase _gemsUseCase;

  @override
  void initState() {
    super.initState();
    _gemsUseCase = GemsUseCase(
      GemsDataRepository(_databaseService),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GemsState(_gemsUseCase),
        ),
      ],
      child: Consumer<GemsState>(
        builder: (context, gemsState, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(appLocale.gems),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Container(),
                    );
                  },
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {
                    gemsState.pageMode = !gemsState.pageMode;
                  },
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    gemsState.pageMode ? Icons.menu_book_outlined : Icons.view_list_sharp,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                const Expanded(
                  child: GemList(),
                ),
                !gemsState.pageMode ? Padding(
                  padding: AppStyles.mardingBottom,
                  child: SmoothPageIndicator(
                    controller: gemsState.controller,
                    count: 54,
                    effect: ScrollingDotsEffect(
                      maxVisibleDots: 7,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      dotColor: appColors.primaryContainer,
                      activeDotColor: appColors.tertiary,
                    ),
                  ),
                ) : const SizedBox(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                gemsState.defaultItem();
              },
              elevation: 0.5,
              tooltip: appLocale.randomCitation,
              child: const Icon(Icons.next_plan_rounded),
            ),
          );
        },
      ),
    );
  }
}
