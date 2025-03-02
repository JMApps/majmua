import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/fortress_chapters_state.dart';
import '../../state/fortress_footnotes_state.dart';
import 'search_fortress_chapter_future.dart';

class SearchFortressChaptersDelegate extends SearchDelegate {
  SearchFortressChaptersDelegate({
    required this.search,
    required this.tableName,
    required this.chaptersState,
    required this.footnotesState,
  }) : super(searchFieldLabel: search, keyboardType: TextInputType.text);

  final String search;
  final String tableName;
  final FortressChaptersState chaptersState;
  final FortressFootnotesState footnotesState;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty ? IconButton(
        onPressed: () {
          query = '';
          },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: transitionAnimation,
        ),
      ) : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: chaptersState),
        ChangeNotifierProvider.value(value: footnotesState),
      ],
      child: SearchFortressChaptersFuture(
        query: query.toLowerCase(),
        tableName: tableName,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: chaptersState),
        ChangeNotifierProvider.value(value: footnotesState),
      ],
      child: SearchFortressChaptersFuture(
        query: query.toLowerCase(),
        tableName: tableName,
      ),
    );
  }
}
