import 'package:flutter/material.dart';

import 'search_cities_builder.dart';

class SearchCitiesDelegate extends SearchDelegate {
  SearchCitiesDelegate({required String hintText})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          searchFieldStyle: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 22,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {
                query = '';
              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.white,
                progress: transitionAnimation,
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      splashRadius: 20,
      icon: Image.asset(
        'assets/icons/angle-left.png',
        width: 20,
        height: 20,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchCitiesBuilder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchCitiesBuilder(query: query);
  }
}
