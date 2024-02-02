import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';

class comCard extends StatelessWidget {
  const comCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 200,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: 270,
                height: 200,
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F8FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/1.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF196AFF),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/2.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF196AFF),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/3.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF196AFF),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70.43,
                top: 25.11,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '7명이 답변한  질문이에요',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                        letterSpacing: -0.12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 54.92,
            top: 67,
            child: SizedBox(
              width: 171.75,
              child: Text(
                'Terraform을 이용한 인프라를 ',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                  letterSpacing: -0.14,
                ),
              ),
            ),
          ),
          Positioned(
            left: 54.92,
            top: 85,
            child: SizedBox(
              width: 171.75,
              child: Text(
                '구성할 때 어떻게 보안 위협들을',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                  letterSpacing: -0.14,
                ),
              ),
            ),
          ),
          Positioned(
            left: 54.92,
            top: 103,
            child: SizedBox(
              width: 171.75,
              child: Text(
                '점검하시나요?',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                  letterSpacing: -0.14,
                ),
              ),
            ),
          ),
          Positioned(
            left: -52.92,
            top: -23,
            child: SizedBox(
              width: 171.75,
              child: Image.asset('assets/images/Q.png'),
            ),
          ),
          Positioned(
            left: 150.92,
            top: 60,
            child: SizedBox(
              width: 171.75,
              child: Image.asset('assets/images/4.png'),
            ),
          ),
        ],
      ),
    );
  }
}
