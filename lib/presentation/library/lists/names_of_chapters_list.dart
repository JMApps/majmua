import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/names_of_content_entity.dart';
import '../../state/library/names_of_state.dart';
import '../../widgets/app_error_text.dart';

class NamesOfChaptersList extends StatelessWidget {
  const NamesOfChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.primary.withAlpha(20);
    final itemEvenColor = appColors.primary.withAlpha(10);
    return Consumer<NamesOfState>(
      builder: (context, namesOfState, _) {
        return IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ChangeNotifierProvider.value(
                  value: namesOfState,
                  child: FutureBuilder<List<NamesOfContentEntity>>(
                    future: namesOfState.getAllContents(),
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
                              final NamesOfContentEntity model = snapshot.data![index];
                              return Container(
                                margin: AppStyles.mardingBottomMini,
                                decoration: BoxDecoration(
                                  borderRadius: AppStyles.mainBorder,
                                  color: index.isOdd ? itemOddColor : itemEvenColor,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    namesOfState.pageIndex = index;
                                    namesOfState.pageController.animateToPage(namesOfState.pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    '${model.id} – ${model.clarificationTitle}',
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
