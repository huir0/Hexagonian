import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class JoinCompletePage extends StatelessWidget {
  const JoinCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    const description = '회원가입이 정상적으로 \n완료되었습니다 :)';
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/signup_complete.png',
            ),
            Text(
              description,
              style: SLTextStyle(
                style: SLStyle.Text_L_Bold,
                color: SLColor.neutral.shade10,
              ).textStyle,
            ),
          ],
        ),
      ),
      // @todo redirect button
    );
  }
}
