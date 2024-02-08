import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLSheet {
  static void bottomSheet(
      {required BuildContext context,
      required Widget child,
      required double height,
      required double width}) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: SLColor.neutral.shade90,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 5,
                    width: 36,
                    decoration: BoxDecoration(
                        color: SLColor.neutral.shade60,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  child
                ],
              ),
            ),
          );
        });
  }
}
