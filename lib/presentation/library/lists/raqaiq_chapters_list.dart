import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/raqaiq_entity.dart';
import '../../state/library/raqaiq_state.dart';
import '../../widgets/app_error_text.dart';

class RaqaiqChaptersList extends StatelessWidget {
  const RaqaiqChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.primary.withAlpha(20);
    final itemEvenColor = appColors.primary.withAlpha(10);
    return Consumer<RaqaiqState>(
      builder: (context, raqaiqState, _) {
        return IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ChangeNotifierProvider.value(
                  value: raqaiqState,
                  child: FutureBuilder<List<RaqaiqEntity>>(
                    future: raqaiqState.getAllRaqaiqs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AppErrorText(text: snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        return Scrollbar(
                          child: ListView.builder(
                            padding: AppStyles.mardingHorizontalMini,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final RaqaiqEntity model = snapshot.data![index];
                              return Container(
                                margin: AppStyles.mardingBottomMini,
                                decoration: BoxDecoration(
                                  borderRadius: AppStyles.mainBorder,
                                  color: index.isOdd ? itemOddColor : itemEvenColor,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    raqaiqState.pageIndex = index;
                                    raqaiqState.pageController.animateToPage(raqaiqState.pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    '${model.id} – ${model.chapterTitle}',
                                    style: AppStyles.mainTextStyleMiniBold,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.format_list_numbered),
        );
      },
    );
  }
}
