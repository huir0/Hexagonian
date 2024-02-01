import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/checkbox/sl_checkbox.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLExpansionTile extends StatefulWidget {
  const SLExpansionTile({
    super.key,
    required this.title,
    this.children,
    this.color,
    this.icon = Icons.expand_less,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    required this.onChange,
  });

  final String title;
  final List<Widget>? children;
  final Color? color;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final void Function(bool) onChange;

  @override
  State<SLExpansionTile> createState() => _SLExpansionTileState();
}

class _SLExpansionTileState extends State<SLExpansionTile> {
  bool isOpen = false;
  void onTap() {
    isOpen = !isOpen;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: widget.padding,
            child: Row(
              children: [
                SLCheckbox(
                  value: false,
                  onChange: widget.onChange,
                ),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                ),
                const Spacer(),
                Icon(
                  isOpen ? Icons.expand_more : widget.icon,
                  color: SLColor.neutral.shade50,
                ),
              ],
            ),
          ),
        ),
        if (widget.children != null && isOpen == true) ...widget.children!,
      ],
    );
  }
}
