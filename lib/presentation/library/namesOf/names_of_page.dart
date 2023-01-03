import 'package:flutter/material.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/application/state/book_pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/names_of_query.dart';
import 'package:majmua/presentation/library/namesOf/names_content_item.dart';
import 'package:majmua/presentation/library/namesOf/names_of_smooth_indicator.dart';
import 'package:provider/provider.dart';

class NamesOfPage extends StatefulWidget {
  const NamesOfPage({Key? key}) : super(key: key);

  @override
  State<NamesOfPage> createState() => _NamesOfPageState();
}

class _NamesOfPageState extends State<NamesOfPage> {
  final NamesOfQuery _namesOfQuery = NamesOfQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookPagesScrollState>(
          create: (_) => BookPagesScrollState(keyForSettingsInitialization: AppConstants.keyNamesOfLastPage),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Имена Аллаха'),
        ),
        body: FutureBuilder(
          future: _namesOfQuery.getAllClarifications(),
          builder: (BuildContext context, snapshot) {
            return snapshot.hasData
                ? Consumer<BookPagesScrollState>(
                    builder: (BuildContext context, scrollState, _) {
                      return Column(
                        children: [
                          const SizedBox(height: 4),
                          NamesOfSmoothIndicator(
                            pageController: scrollState.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: scrollState.getPageController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return NamesContentItem(
                                  item: snapshot.data![index],
                                  index: index,
                                );
                              },
                              onPageChanged: (page) {
                                scrollState.changePageForLast(currentPage: page);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ),
      ),
    );
  }
}
