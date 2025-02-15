import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/supplication_data_repository.dart';
import '../../../data/services/databases/database_sfq_service.dart';
import '../../../domain/usecases/supplication_use_case.dart';
import '../../state/sfq_state.dart';
import '../lists/supplication_list.dart';

class SfqPage extends StatefulWidget {
  const SfqPage({super.key});

  @override
  State<SfqPage> createState() => _SfqPageState();
}

class _SfqPageState extends State<SfqPage> {
  final DatabaseSFQService _databaseService = DatabaseSFQService();
  late final SupplicationUseCase _supplicationUseCase;

  @override
  void initState() {
    super.initState();
    _supplicationUseCase = SupplicationUseCase(
      SupplicationDataRepository(_databaseService),
    );
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
                    showModalBottomSheet(context: context, builder: (context) => Container());
                  },
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {
                    sfqState.defaultItem();
                  },
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.next_plan),
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
                  child: SupplicationList(),
                ),
                !sfqState.pageMode ? Padding(
                  padding: AppStyles.mardingBottom,
                  child: SmoothPageIndicator(
                      controller: sfqState.controller,
                      count: 54,
                      effect: ScrollingDotsEffect(
                        maxVisibleDots: 7,
                        dotWidth: 12.0,
                        dotHeight: 12.0,
                        dotColor: appColors.primaryContainer,
                        activeDotColor: appColors.tertiary,
                      ),
                  ),
                ) : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
