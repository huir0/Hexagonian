import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SFACPopUpDialog extends StatelessWidget {
  const SFACPopUpDialog({
    super.key,
    required this.widget,
    this.onCanceled,
    required this.onConfirmed,
  });
  /// 팝업 내용
  final Widget widget;
  /// 취소 누를 시
  final VoidCallback? onCanceled;
  /// 확인 누를 시
  final VoidCallback onConfirmed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 282,
        height: 147,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                color: SLColor.neutral[10],
              ),
              height: 101,
              child: widget,
            ),
            onCanceled != null
                ? Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onCanceled,
                          child: Container(
                            alignment: Alignment.center,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10)),
                              color: SLColor.neutral[30],
                            ),
                            child: Text('취소',
                                style: SLTextStyle.Text_L_Bold?.copyWith(
                                    color: SLColor.neutral[60],
                                    fontFamily: 'Pretendard')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onConfirmed,
                          child: Container(
                            alignment: Alignment.center,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10)),
                              color: SLColor.primary[100],
                            ),
                            child: Text('확인',
                                style: SLTextStyle.Text_L_Bold?.copyWith(
                                    color: SLColor.neutral[10],
                                    fontFamily: 'Pretendard')),
                          ),
                        ),
                      ),
                    ],
                  )
                : Expanded(
                    child: GestureDetector(
                      onTap: onConfirmed,
                      child: Container(
                        alignment: Alignment.center,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: SLColor.primary[100],
                        ),
                        child: const Text('확인',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
