import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/presentation/fortress/search_chapters_delegate.dart';

import '../../core/styles/app_styles.dart';
import '../../data/repositories/fortress_data_repository.dart';
import '../../domain/entities/chapter_fortress_entity.dart';
import '../../domain/usecases/fortress_use_case.dart';
import '../widgets/error_data_text.dart';
import '../widgets/user_back_button.dart';
import 'chapter_item.dart';

class FortressChaptersPage extends StatefulWidget {
  const FortressChaptersPage({super.key});

  @override
  State<FortressChaptersPage> createState() => _FortressChaptersPageState();
}

class _FortressChaptersPageState extends State<FortressChaptersPage> {
  final FortressUseCase _fortressUseCase = FortressUseCase(FortressDataRepository());

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.fortress),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchChaptersDelegate(
                  hintText: appLocale.searchByChapters,
                ),
              );
            },
            splashRadius: 20,
            tooltip: appLocale.searchByChapters,
            icon: Image.asset(
              'assets/icons/search.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ChapterFortressEntity>>(
        future: _fortressUseCase.fetchAllChapters(
          tableName: appLocale.tableOfChapter,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final ChapterFortressEntity model = snapshot.data![index];
                  return ChapterItem(
                    model: model,
                    index: index,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorDataText(errorText: snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
