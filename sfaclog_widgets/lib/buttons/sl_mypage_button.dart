import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SFACResumeButton extends StatelessWidget {
  const SFACResumeButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.subText,
    this.icon,
  });
  final VoidCallback onPressed;
  final String title;
  final String? subText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: SLColor.neutral[100],
            padding: EdgeInsets.all(0)),
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 17,
            ),
            SizedBox(
              height: 16,
              child: Text(
                title,
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            SizedBox(
              height: 14,
              child: subText != null
                  ? Text(
                      subText!,
                      style: SLTextStyle.Text_XS_Medium?.copyWith(
                          color: SLColor.neutral[40]),
                    )
                  : Text(''),
            ),
            Spacer(),
            Container(
              // color: Colors.white,
              width: 20,
              height: 20,
              child: icon ?? SvgPicture.asset('assets/icons/add.svg', color: SLColor.neutral[60],),
            ),
            SizedBox(
              width: 14,
            )
          ],
        ),
      ),
    );
  }
}

class SFACExpandableButton extends StatefulWidget {
  final String text;
  final String count;
  final Widget posts;

  const SFACExpandableButton({
    Key? key,
    required this.text,
    required this.count,
    required this.posts,
  }) : super(key: key);

  @override
  _SFACExpandableButtonState createState() => _SFACExpandableButtonState();
}

class _SFACExpandableButtonState extends State<SFACExpandableButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 312,
          height: 52,
          child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                backgroundColor: SLColor.neutral[80],
                padding: EdgeInsets.all(0)),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: [
                SizedBox(width: 14,),
                Text(
                  widget.text,
                  style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
                ),
                SizedBox(width: 6),
                Text(
                  widget.count,
                  style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
                ),
                Spacer(),
                _isExpanded
                    ? SvgPicture.asset('assets/icons/arrow_up.svg')
                    : SvgPicture.asset('assets/icons/arrow_down.svg'),
                SizedBox(
                  width: 24,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded) widget.posts,
      ],
    );
  }
}
