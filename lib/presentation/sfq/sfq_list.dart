import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/styles/app_styles.dart';
import '../../data/repositories/sfq_data_repository.dart';
import '../../domain/entities/sfq_entity.dart';
import '../../domain/usecases/sfq_use_case.dart';
import '../widgets/error_data_text.dart';
import '../widgets/user_back_button.dart';
import 'sfq_item.dart';

class SFQList extends StatefulWidget {
  const SFQList({super.key});

  @override
  State<SFQList> createState() => _SFQListState();
}

class _SFQListState extends State<SFQList> {
  final SFQUseCase _sfqUseCase = SFQUseCase(SFQDataRepository());
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        if (_itemScrollController.isAttached) {
          _itemScrollController.scrollTo(
            index: Random().nextInt(54),
            duration: const Duration(milliseconds: 750),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.sfq),
        actions: [
          IconButton(
            onPressed: () {
              _itemScrollController.scrollTo(
                index: Random().nextInt(54),
                duration: const Duration(milliseconds: 750),
              );
            },
            splashRadius: 20,
            icon: Image.asset(
              'assets/icons/refresh.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<SFQEntity>>(
        future: _sfqUseCase.fetchAllSupplications(
            tableName: appLocale.sfqTableName),
        builder:
            (BuildContext context, AsyncSnapshot<List<SFQEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ScrollablePositionedList.builder(
              itemScrollController: _itemScrollController,
              padding: AppStyles.mainMardingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final SFQEntity model = snapshot.data![index];
                return SFQItem(
                  model: model,
                  index: index,
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
