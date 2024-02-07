import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/view/pages/my_page/my_category_add_page.dart';

import '../../../common.dart';
import '../../widgets/mypage_widgets/my_appbar_widget.dart';
import 'my_category_edit_page.dart';

class MypageCategory extends StatefulWidget {
  const MypageCategory({super.key});

  @override
  State<MypageCategory> createState() => _MypageCategoryState();
}

const List<String> category = ['회고록', '개발자 일상'];

class _MypageCategoryState extends State<MypageCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '나의 카테고리',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 51,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Text(
                      '전체로그',
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('number'),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/check_blue.svg',
                    ),
                  ],
                ),
              ),
              Divider(
                color: SLColor.neutral[80],
                height: 1,
              ),
              for (var i = 0; i < category.length; i++) ...[
                GestureDetector(
                  onTap: () {
                    // TODO: locked, 메뉴 설정
                  },
                  child: Container(
                    width: 312,
                    height: 51,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          category[i],
                          style: SLTextStyle.Text_M_Medium?.copyWith(
                              color: SLColor.neutral[50]),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        // TODO: 글 개수 연결
                        Text('number'),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset('assets/icons/padlock.svg'),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: SLColor.neutral[80],
                )
              ],
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MypageAddCategory()));
                },
                child: Container(
                  height: 51,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        '카테고리 추가',
                        style: SLTextStyle.Text_M_Medium?.copyWith(
                            color: Colors.white),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/icons/check_blue.svg',
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: SLColor.neutral[80],
                height: 1,
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MypageEditCategory()));
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 51,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        '카테고리 편집',
                        style: SLTextStyle.Text_M_Medium?.copyWith(
                            color: Colors.white),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/icons/check_blue.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
