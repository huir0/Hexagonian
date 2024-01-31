import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_appbar_widget.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_footer_widget.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_header_widget.dart';

class LogReadPage extends StatelessWidget {
  const LogReadPage({super.key});

  @override
  Widget build(BuildContext context) {
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
