import 'package:flutter/material.dart';
import 'package:majmua/application/state/book_settings_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class MainBookSettings extends StatelessWidget {
  const MainBookSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: AppStyles.mainCardBorderRadius,
      margin: AppStyles.mainMargin,
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Consumer<BookSettingsState>(
          builder: (BuildContext context, bookSettingsState, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Размер текста',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Slider.adaptive(
                    min: 14,
                    max: 60,
                    value: bookSettingsState.getTextSize,
                    onChanged: (double? value) {
                      bookSettingsState.setChangeTextSize = value!;
                    },
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: appColors.secondAppColor,
                    child: Text(
                      bookSettingsState.getTextSize.toStringAsFixed(0).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // ListTile(
                //   visualDensity: const VisualDensity(vertical: -4),
                //   contentPadding: EdgeInsets.zero,
                //   title: const Text(
                //     'Цвет текста',
                //     style: TextStyle(
                //       fontSize: 16,
                //     ),
                //   ),
                //   trailing: CircleAvatar(
                //     backgroundColor: Color(bookSettingsState.getTextColor),
                //     child: InkWell(
                //       onTap: () {
                //         showDialog(
                //           context: context,
                //           builder: (_) => AlertDialog(
                //             shape: AppStyles.mainCardBorderRadius,
                //             content: BlockPicker(
                //               pickerColor: Color(bookSettingsState.getTextColor),
                //               onColorChanged: (color) {
                //                 bookSettingsState.setChangeTextColor = color.value;
                //                 Navigator.of(context).pop();
                //               },
                //             ),
                //           ),
                //         );
                //       },
                //       borderRadius: AppStyles.mainBorderRadius,
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
