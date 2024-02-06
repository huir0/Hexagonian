import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class LogCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final String label;

  const LogCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color:
                  isChecked ? SLColor.primary : SLColor.neutral.shade70, // 배경색
              borderRadius: BorderRadius.circular(4.0),
            ),
            width: 20.0,
            height: 20.0,
            child: isChecked
                ? const Icon(Icons.check,
                    size: 14.0, color: Colors.white) // 체크 표시
                : null,
          ),
          const SizedBox(width: 8.0),
          Text(label),
        ],
      ),
    );
  }
}
