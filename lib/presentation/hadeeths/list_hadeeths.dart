import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/hadeeths/hadeeth_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListHadeeths extends StatefulWidget {
  const ListHadeeths({Key? key}) : super(key: key);

  @override
  State<ListHadeeths> createState() => _ListHadeethsState();
}

class _ListHadeethsState extends State<ListHadeeths> {
  final _hadeethsController =
      PageController(initialPage: Random().nextInt(42), viewportFraction: 0.75);
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseQuery.getHadeeths(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  const Text(
                    '40 хадисов имама ан-Навави',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 175,
                    child: PageView.builder(
                      controller: _hadeethsController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HadeethItem(
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_hadeethsController.hasClients) {
                            _hadeethsController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _hadeethsController,
                        count: snapshot.data!.length,
                        effect: const ScrollingDotsEffect(
                          maxVisibleDots: 11,
                          dotWidth: 4,
                          dotHeight: 12,
                          dotColor: Color(0xFFFFAB91),
                          activeDotColor: Colors.deepOrange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_hadeethsController.hasClients) {
                            _hadeethsController.animateToPage(
                              snapshot.data!.length - 1,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          child: Text(
                            '${snapshot.data!.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                ],
              )
            : const Center(
                child: Padding(
                  padding: MainAppStyle.mainPadding,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
      },
    );
  }
}
