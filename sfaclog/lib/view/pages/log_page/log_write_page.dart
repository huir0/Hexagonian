import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown_toolbar/markdown_toolbar.dart';

class LogWritePage extends StatefulWidget {
  const LogWritePage({super.key});

  @override
  State<LogWritePage> createState() => _LogWritePageState();
}

class _LogWritePageState extends State<LogWritePage> {
  final TextEditingController _controller =
      TextEditingController(); // Declare the TextEditingController
  late final FocusNode _focusNode;
  @override
  void initState() {
    _controller
        .addListener(() => setState(() {})); // Update the text when typing
    _focusNode = FocusNode(); // Assign a FocusNode
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the TextEditingController
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그 쓰기'),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: const Text('완료'))],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: _controller, // Add the _controller
                  focusNode: _focusNode, // Add the _focusNode
                ),
              ],
            )),
          ),
          MarkdownToolbar(
            useIncludedTextField:
                false, // Because we want to use our own, set useIncludedTextField to false
            controller: _controller, // Add the _controller
            focusNode: _focusNode, // Add the _focusNode
          ),
        ],
      ),
    );
  }
}
