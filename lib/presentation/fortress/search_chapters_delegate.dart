import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/presentation/fortress/search_chapters_builder.dart';
import 'package:majmua/presentation/widgets/info_data_text.dart';

class SearchChaptersDelegate extends SearchDelegate {
  SearchChaptersDelegate({required String hintText})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          searchFieldStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
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
          fontSize: 16,
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
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchChaptersBuilder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 2) {
      return SearchChaptersBuilder(query: query);
    } else {
      final AppLocalizations? locale = AppLocalizations.of(context);
      return InfoDataText(infoText: locale!.startSearch);
    }
  }
}
