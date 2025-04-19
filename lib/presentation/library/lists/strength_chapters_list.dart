import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/strength_entity.dart';
import '../../state/library/strength_state.dart';
import '../../widgets/app_error_text.dart';

class StrengthChaptersList extends StatelessWidget {
  const StrengthChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.primary.withAlpha(20);
    final itemEvenColor = appColors.primary.withAlpha(10);
    return Consumer<StrengthState>(
      builder: (context, strengthState, _) {
        return IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ChangeNotifierProvider.value(
                  value: strengthState,
                  child: FutureBuilder<List<StrengthEntity>>(
                    future: strengthState.getAllStrengths(),
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
                              final StrengthEntity model = snapshot.data![index];
                              return Container(
                                margin: AppStyles.mardingBottomMini,
                                decoration: BoxDecoration(
                                  borderRadius: AppStyles.mainBorder,
                                  color: index.isOdd ? itemOddColor : itemEvenColor,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    strengthState.pageIndex = index;
                                    strengthState.pageController.animateToPage(strengthState.pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
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
