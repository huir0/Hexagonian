import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/chip2.dart';

void main() {
  runApp(CardWidget());
}

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidetState();
}

class _CardWidetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: cardContainer(),
    );
  }
}

class cardContainer extends StatelessWidget {
  const cardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 270,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xFFF5F8FF),
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 44,
                      height: 20,
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Container(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/image/naver.png'),
                                ),
                              )),
                          Positioned(
                            left: 7,
                            child: Container(
                              width: 20,
                              height: 20,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/image/naver.png'),
                                  )),
                            ),
                          ),
                          Positioned(
                            left: 14,
                            child: Container(
                              width: 20,
                              height: 20,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/image/naver.png'),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('7명이 답변한 질문이에요'),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 23,
                    child: Image.asset('assets/image/naver.png'),
                  ),
                  Text('Terraform을 이용한 인프라를 \n구성할 때 어떻게 보안 위협들을\n 점검하시나요?'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  BlueChip(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
