import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sfaclog/view/widgets/common_widgets/tag_widget.dart';

class QuestionBodyWidget extends StatelessWidget {
  const QuestionBodyWidget({
    super.key,
    required this.content,
    this.tags,
  });
  final String content;
  final List<dynamic>? tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Html(
            data: content,
            style: {
              "body": Style(
                fontSize: FontSize(14),
                margin: Margins.zero,
              ),
            },
          ),
          if (tags != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Wrap(
                  children: buildTags(tags!),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

List<Widget> buildTags(List<dynamic> tags) {
  List<Widget> result = [];
  if (tags.isEmpty) return [];
  for (int i = 0; i < tags.length; i++) {
    result.add(TagWidget(label: tags[i]['name']));
  }

  return [...result];
}
