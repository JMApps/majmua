import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/book_settings_state.dart';
import '../../widgets/book_settings.dart';

class BookSettingsBtn extends StatelessWidget {
  const BookSettingsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookSettingsState>(
      builder: (context, settings, _) {
        return IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => ChangeNotifierProvider.value(
                value: settings,
                child: BookSettings(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        );
      },
    );
  }
}
