import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/sfq_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/sfq_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/sfq_item.dart';

class SFQList extends StatelessWidget {
  const SFQList({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<SFQState>(
      builder: (context, sfqState, _) {
        return FutureBuilder(
          future: sfqState.fetchAllSupplications(tableName: appLocale.sfqTableName),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return AppErrorText(text: snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return sfqState.pageMode
                  ? ScrollablePositionedList.builder(
                      itemScrollController: sfqState.itemController,
                      padding: AppStyles.mainMardingMini,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final SFQEntity supplicationModel = snapshot.data![index];
                        return SFQItem(
                          supplicationModel: supplicationModel,
                          index: index,
                        );
                      },
                    ) : PageView.builder(
                      controller: sfqState.controller,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final SFQEntity supplicationModel = snapshot.data![index];
                        return Padding(
                          padding: AppStyles.mainMardingMini,
                          child: SFQItem(
                            supplicationModel: supplicationModel,
                            index: index,
                          ),
                        );
                      },
                      onPageChanged: (int page) {
                        sfqState.lastPage = page;
                      },
                    );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        );
      },
    );
  }
}
