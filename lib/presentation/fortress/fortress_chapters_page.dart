import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/data/repositories/fortress_data_repository.dart';
import 'package:majmua/domain/entities/chapter_fortress_entity.dart';
import 'package:majmua/domain/usecases/fortress_use_case.dart';
import 'package:majmua/presentation/fortress/chapter_item.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';

class FortressChaptersPage extends StatefulWidget {
  const FortressChaptersPage({super.key});

  @override
  State<FortressChaptersPage> createState() => _FortressChaptersPageState();
}

class _FortressChaptersPageState extends State<FortressChaptersPage> {
  late final FortressUseCase _fortressUseCase = FortressUseCase(FortressDataRepository());

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.fortress),
      ),
      body: FutureBuilder<List<ChapterFortressEntity>>(
        future: _fortressUseCase.fetchAllChapters(tableName: appLocale.tableOfChapter),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final ChapterFortressEntity model = snapshot.data![index];
                return ChapterItem(
                  model: model,
                );
              },
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
