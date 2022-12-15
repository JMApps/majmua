import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';
import 'package:majmua/presentation/names/name_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListNames extends StatefulWidget {
  const ListNames({Key? key}) : super(key: key);

  @override
  State<ListNames> createState() => _ListNamesState();
}

class _ListNamesState extends State<ListNames> {
  final _namesController =
      PageController(initialPage: Random().nextInt(99), viewportFraction: 0.75);
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseQuery.getNames(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: SelectableText('${snapshot.error}'),
          );
        }
        return snapshot.hasData
            ? Column(
                children: [
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  const Text(
                    'Прекрасные имена Аллаха',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: _namesController,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NameItem(
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SmoothPageIndicator(
                    controller: _namesController,
                    count: snapshot.data!.length,
                    effect: const ScrollingDotsEffect(
                      maxVisibleDots: 11,
                      dotWidth: 4,
                      dotHeight: 12,
                      dotColor: Color(0xFF9FA8DA),
                      activeDotColor: Colors.indigo,
                      spacing: 8
                    ),
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
