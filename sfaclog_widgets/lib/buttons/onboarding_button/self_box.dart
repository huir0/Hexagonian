import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/checkbox/sl_checkbox.dart';

class SelfBox extends StatelessWidget {
  final String text;
  final int color;
  const SelfBox(
      {Key? key, this.text = "본인인증 약관 전체동의(필수)", this.color = 0xFF020202})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      width: 312,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          SLCheckbox(
            value: false,
            onChange: (bool newValue) {
              print('Checkbox: $newValue');
            },
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 168,
            height: 21,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 60,
          ),
          Container(
            child: Image.asset('assets/images/check.png'),
          )
        ],
      ),
    );
  }
}
///ex: SelfBox(
          //   text: '본인인증 약관 전체동의(필수)',
          // ),
