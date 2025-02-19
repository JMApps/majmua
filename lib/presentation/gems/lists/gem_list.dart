import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/gem_entity.dart';
import '../../state/gems_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/gem_item.dart';

class GemList extends StatelessWidget {
  const GemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GemsState>(
      builder: (context, gemsState, _) {
        return FutureBuilder(
          future: gemsState.fetchAllGems(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return AppErrorText(text: snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return gemsState.pageMode ? ScrollablePositionedList.builder(
                itemScrollController: gemsState.itemController,
                padding: AppStyles.mainMardingMini,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final GemEntity gemModel = snapshot.data![index];
                  return GemItem(
                    gemModel: gemModel,
                    index: index,
                  );
                },
              ) : PageView.builder(
                controller: gemsState.controller,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final GemEntity gemModel = snapshot.data![index];
                  return Padding(
                    padding: AppStyles.mainMardingMini,
                    child: GemItem(
                      gemModel: gemModel,
                      index: index,
                    ),
                  );
                },
                onPageChanged: (int page) {
                  gemsState.lastPage = page;
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
