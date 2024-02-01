import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_appbar_widget.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_footer_widget.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_header_widget.dart';

class LogReadPage extends StatelessWidget {
  const LogReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var markDownData = ''' # 제목 1 
## 제목 2
### 제목 3
#### 제목 4
    ''';
    return SafeArea(
        child: Scaffold(
      appBar: const LogReadAppBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogReadHeaderWidget(),
                  Divider(
                    height: 1,
                    color: SLColor.neutral.shade80,
                  ),
                  SizedBox(
                      height: 400,
                      child: Markdown(
                        data: markDownData,
                        styleSheet: MarkdownStyleSheet(
                          h1: const TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                          h2: const TextStyle(color: Colors.pink, fontSize: 30),
                        ),
                      ))
                ],
              ),
            ),
          ),
          const LogReadFooterWidget(),
        ],
      ),
    ));
  }
}
