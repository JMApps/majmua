import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/sfq_data_repository.dart';
import '../../../data/services/databases/sfq_database_service.dart';
import '../../../domain/usecases/sfq_use_case.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/sfq_state.dart';
import '../lists/sfq_list.dart';
import '../widgets/sfq_settings.dart';

class SfqPage extends StatefulWidget {
  const SfqPage({super.key});

  @override
  State<SfqPage> createState() => _SfqPageState();
}

class _SfqPageState extends State<SfqPage> {
  final SFQDatabaseService _databaseService = SFQDatabaseService();
  late final SFQUseCase _supplicationUseCase;

  @override
  void initState() {
    super.initState();
    _supplicationUseCase = SFQUseCase(
      SFQDataRepository(_databaseService),
    );
  }

  @override
  void dispose() {
    _databaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SFQState(_supplicationUseCase),
        ),
      ],
      child: Consumer<SFQState>(
        builder: (context, sfqState, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(appLocale.sQuran),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => ChangeNotifierProvider.value(
                        value: sfqState,
                        child: const SfqSettings(),
                      ),
                    );
                  },
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {
                    sfqState.pageMode = !sfqState.pageMode;
                  },
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    sfqState.pageMode ? Icons.menu_book_outlined : Icons.view_list_sharp,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                const Expanded(
                  child: SFQList(),
                ),
                !sfqState.pageMode ? Padding(
                  padding: AppStyles.mardingBottom,
                  child: SmoothPageIndicator(
                    controller: sfqState.controller,
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
                sfqState.defaultItem();
              },
              elevation: 0.5,
              tooltip: appLocale.randomAyah,
              child: const Icon(Icons.autorenew_rounded),
            ),
          );
        },
      ),
    );
  }
}
