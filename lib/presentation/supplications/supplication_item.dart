import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_supplication_item.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final ModelSupplicationItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: MainAppStyle.mainBorderRadius,
      ),
      child: ListView(
        padding: MainAppStyle.mainPadding,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE91E63),
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          item.supplicationArabic != null
              ? const SizedBox(height: 16)
              : const SizedBox(),
          item.supplicationArabic != null
              ? Text(
                  item.supplicationArabic!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Lateef',
                  ),
                  textDirection: TextDirection.rtl,
                )
              : const SizedBox(),
          item.supplicationTranscription != null
              ? const SizedBox(height: 16)
              : const SizedBox(),
          item.supplicationTranscription != null
              ? Text(
                  item.supplicationTranscription!,
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                )
              : const SizedBox(),
          const SizedBox(height: 16),
          Html(
            data: item.supplicationTranslation,
            style: {
              '#': Style(
                fontSize: const FontSize(18),
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
              ),
              'small': Style(
                fontSize: const FontSize(12),
                color: Colors.grey,
              ),
              'a': Style(
                fontSize: const FontSize(14),
                color: const Color(0xFFE91E63),
              ),
            },
            onLinkTap: (String? url, RenderContext rendContext,
                Map<String, String> attributes, element) {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => SingleChildScrollView(
                  child: Container(
                    padding: MainAppStyle.mainPadding,
                    margin: MainAppStyle.mainMargin,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: MainAppStyle.mainBorderRadius,
                    ),
                    child: Html(
                      data: url,
                      style: {
                        '#': Style(
                          fontSize: const FontSize(16),
                        ),
                        'small': Style(
                          fontSize: const FontSize(12),
                          color: Colors.grey,
                        )
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
