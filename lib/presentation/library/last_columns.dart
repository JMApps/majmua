import 'package:flutter/material.dart';
import 'package:majmua/presentation/library/card_join_library.dart';
import 'package:majmua/presentation/sfq/card_select_sfq.dart';
import 'package:majmua/presentation/supplications/card_select_supplications.dart';
import 'package:majmua/presentation/surah/card_select_surahs.dart';

class LastColumns extends StatelessWidget {
  const LastColumns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            SizedBox(width: 8),
            Expanded(
              child: CardSelectSupplications(),
            ),
            SizedBox(width: 8),
            Expanded(
              child: CardSelectSurahs(),
            ),
            SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 8),
        const CardSelectSFQ(),
        const SizedBox(height: 8),
        const CardJoinLibrary(),
      ],
    );
  }
}
