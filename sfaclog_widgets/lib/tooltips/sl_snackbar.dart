import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLSnackbar extends SnackBar {
  SLSnackbar({
    super.key,
    required this.description,
    this.contentTextStyle,
    this.buttonText = '확인',
    this.buttonTextStyle,
    required this.onTap,
    this.image,
    this.borderRadius = 10,
    this.imageRadius = 27.62 / 2,
    this.animationDuration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) : super(
          content: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    image != null
                        ? CircleAvatar(
                            radius: 27.62 / 2,
                            backgroundImage: NetworkImage(
                              image,
                            ),
                          )
                        : Image.asset(
                            'assets/images/basic_profile_sm.png',
                            fit: BoxFit.cover,
                            width: 27.62,
                          ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        description,
                        style: contentTextStyle ??
                            SLTextStyle(
                              style: SLStyle.Text_M_Regular,
                            ).textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  buttonText,
                  style: contentTextStyle ??
                      SLTextStyle(
                        style: SLStyle.Text_M_Medium,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          backgroundColor: SLColor.neutral,
          behavior: SnackBarBehavior.floating,
          margin: margin ?? const EdgeInsets.all(20),
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 14,
              ),
        );
  final TextStyle? contentTextStyle;
  final String description;
  final String buttonText;
  final String? buttonTextStyle;
  final VoidCallback onTap;
  final double borderRadius;
  final String? image;
  final double? imageRadius;
  final Duration? animationDuration;

  @override
  State<SLSnackbar> createState() => _SLSnackbarState();
}

class _SLSnackbarState extends State<SLSnackbar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: widget.content,
      padding: widget.padding,
    );
  }
}

class SLSnackbarExample extends StatelessWidget {
  const SLSnackbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SLSnackbar(
                    description: 'hello',
                    onTap: () {},
                    imageRadius: 20,
                  ),
                );
              },
              child: const Text('Snackbar Button')),
        ],
      ),
    );
  }
}
