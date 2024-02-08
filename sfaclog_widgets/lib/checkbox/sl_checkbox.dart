import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLCheckbox extends StatefulWidget {
  const SLCheckbox({
    super.key,
    required this.onChange,
    required this.value,
  });
  final ValueChanged<bool> onChange;
  final bool value;

  @override
  State<SLCheckbox> createState() => _SLCheckboxState();
}

class _SLCheckboxState extends State<SLCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    _isChecked = widget.value;
    super.initState();
  }

  void onSwitch() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChange(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSwitch,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4),
          color: _isChecked == true ? SLColor.primary : SLColor.neutral.shade70,
        ),
        child: SvgPicture.asset(
          'assets/icons/check.svg',
          colorFilter: ColorFilter.mode(
            _isChecked == true ? Colors.white : SLColor.neutral.shade70,
            BlendMode.srcIn,
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

// how to use
class SLCheckboxExample extends StatelessWidget {
  const SLCheckboxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SLCheckbox(
      value: false,
      onChange: (newValue) {
        print('Checkbox: $newValue');
      },
    );
  }
}
