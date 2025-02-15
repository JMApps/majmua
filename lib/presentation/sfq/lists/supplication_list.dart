import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../state/sfq_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/supplication_item.dart';

class SupplicationList extends StatelessWidget {
  const SupplicationList({super.key});

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
              return sfqState.pageMode ? ScrollablePositionedList.builder(
                itemScrollController: sfqState.itemController,
                padding: AppStyles.mainMardingMini,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final SupplicationEntity supplicationModel = snapshot.data![index];
                  return SupplicationItem(
                    supplicationModel: supplicationModel,
                    index: index,
                  );
                },
              ) : PageView.builder(
                controller: sfqState.controller,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final SupplicationEntity supplicationModel = snapshot.data![index];
                  return Padding(
                    padding: AppStyles.mainMardingMini,
                    child: SupplicationItem(
                      supplicationModel: supplicationModel,
                      index: index,
                    ),
                  );
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
