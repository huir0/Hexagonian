import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/popup/sl_popup_dialog.dart';

Future<dynamic> errorExceptionPopup(
  context, {
  required final String title,
  final String? message,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SFACPopUpDialog(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: SLTextStyle.Text_L_Bold?.copyWith(
                  color: SLColor.neutral[100]),
            ),
            if (message != null)
              Text(
                message,
                style: SLTextStyle.Text_S_Medium?.copyWith(
                  color: SLColor.neutral[100],
                ),
              ),
          ],
        ),
        onConfirmed: () {
          Navigator.pop(context);
        },
      );
    },
  );
}
