import 'package:flutter/material.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/application/state/book_pages_scroll_state.dart';
import 'package:majmua/data/database/local/service/hadeeth_query.dart';
import 'package:majmua/presentation/library/hadeeth/hadeeth_item.dart';
import 'package:majmua/presentation/library/hadeeth/hadeeth_smooth_indicator.dart';
import 'package:provider/provider.dart';

class HadeethPage extends StatefulWidget {
  const HadeethPage({Key? key}) : super(key: key);

  @override
  State<HadeethPage> createState() => _HadeethPageState();
}

class _HadeethPageState extends State<HadeethPage> {
  final HadeethQuery _hadeethQuery = HadeethQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookPagesScrollState>(
          create: (_) => BookPagesScrollState(keyForSettingsInitialization: AppConstants.keyHadeethLastPage),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('40 хадисов'),
        ),
        body: Consumer<BookPagesScrollState>(
          builder: (BuildContext context, scrollState, _) {
            return FutureBuilder(
              future: _hadeethQuery.getAllHadeeth(),
              builder: (BuildContext context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: scrollState.getPageController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return HadeethItem(
                                  item: snapshot.data![index],
                                );
                              },
                              onPageChanged: (page) {
                                scrollState.changePageForLast(currentPage: page);
                              },
                            ),
                          ),
                          HadeethSmoothIndicator(
                            pageController: scrollState.getPageController,
                            listLength: snapshot.data!.length,
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
