import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_card_widget.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_listtile_widget.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

bool isVerifiedEmail = false;

List<String> itemList = ['1', '2', '3', '4'];
var optionList = ['등록순', '최신순'];
String selectedOption = optionList[0];

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '개발자 인기글',
            style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.725,
            enlargeCenterPage: true,
          ),
          items: itemList.map((item) {
            return InkWell(
                onTap: () {
                  context.push('/log/read');
                },
                child: const LogPageCardWidget());
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 16,
            left: 24,
            right: 24,
          ),
          child: Text(
            '새로운 로그를 살펴봐요',
            style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SFACSearchBar(
            height: 37,
            width: 317,
            active: false,
            hintText: '#프론트앤드 #백앤드 #개발자일상',
            onTap: () {
              context.push('/log/search');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 101010 로그',
                style: SLTextStyle(style: SLStyle.Text_M_Medium).textStyle,
              ),
              SFACMenuButton(
                items: optionList,
                onItemSelected: (value) {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const LogListTileWidget();
            },
          ),
        )
      ],
    );
  }
}

class LogSearchBarWidget extends StatelessWidget {
  const LogSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double searchBarW = 317;
    double searchBarH = 37;
    bool active = true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: searchBarW,
        height: searchBarH,
        decoration: const BoxDecoration(
          color: SLColor.neutral,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          width: searchBarW,
          child: TextField(
            cursorColor: SLColor.primary.shade70,
            onTap: () {
              active ? null : print('NotActive');
            },
            readOnly: !active,
            decoration: InputDecoration(
              hintStyle: SLTextStyle(
                      style: SLStyle.Text_S_Medium,
                      color: SLColor.neutral.shade60)
                  .textStyle,
              hintText: '#프론트앤드 #백앤드 #개발자일상',
              suffixIcon: const Icon(
                Icons.search,
                color: SLColor.primary,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(bottom: 9, left: 15),
            ),
          ),
        ),
      ),
    );
  }
}

// Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     '#프론트앤드',
//                     style: SLTextStyle(style: SLStyle.Text_S_Medium).textStyle,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     '#백앤드',
//                     style: SLTextStyle(style: SLStyle.Text_S_Medium).textStyle,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     '#개발자일상',
//                     style: SLTextStyle(style: SLStyle.Text_S_Medium).textStyle,
//                   ),
//                 ],
//               ),
//               const Row(
//                 children: [
//                   Icon(
//                     Icons.search_outlined,
//                     color: SLColor.primary,
//                   )
//                 ],
//               ),
//             ],
//           ),
