import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/view/pages/my_page/my_category_add_page.dart';
import 'package:sfaclog/viewmodel/my_log_viewmodel/my_log_notifier.dart';

import '../../../common.dart';
import '../../../model/log_category_model.dart';
import '../../widgets/mypage_widgets/my_appbar_widget.dart';
import 'my_category_edit_page.dart';

class MypageCategory extends ConsumerStatefulWidget {
  const MypageCategory({
    super.key,
    required this.userId,
  });
  final String userId;
  @override
  ConsumerState<MypageCategory> createState() => _MypageCategoryState();
}

class _MypageCategoryState extends ConsumerState<MypageCategory> {
  RemoteDataSource _remoteDataSource = RemoteDataSource();
  List<LogCategoryModel> categoryList = [
    LogCategoryModel(name: '전체로그', log: '', user: '', public: 'public')
  ];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    List<RecordModel> categoryData = await _remoteDataSource.getTableData(
        tableName: 'category',
        filter: 'user.id = "${widget.userId}"') as List<RecordModel>;
    setState(() {
      for (RecordModel item in categoryData) {
        LogCategoryModel data = LogCategoryModel.fromJson(item.data);
        categoryList.add(data);
      }
    });
    ref.read(myPageLogProvider.notifier).setCategoryList(categoryList);
  }

  @override
  Widget build(BuildContext context) {
    var categorys = ref.watch(myPageLogProvider).categoryList;
    var selectedIndex = ref.watch(myPageLogProvider).categoryIndex;
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '나의 카테고리',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < categorys.length; i++) ...[
                GestureDetector(
                  onTap: () async {
                    selectedIndex = i;
                    if (i != 0) {
                      var newLogList = await ref
                          .read(myPageLogProvider.notifier)
                          .getUserLogs(
                              userId: widget.userId,
                              expand: 'user',
                              filter: 'category = "${categorys[i].name}"');

                      ref
                          .read(myPageLogProvider.notifier)
                          .setUserLogs(newLogList);
                      ref
                          .read(myPageLogProvider.notifier)
                          .setCategory(categorys[i].name);
                      ref.read(myPageLogProvider.notifier).setCategoryIndex(i);
                    } else {
                      var newLogList = await ref
                          .read(myPageLogProvider.notifier)
                          .getUserLogs(
                            userId: widget.userId,
                            expand: 'user',
                            filter: '',
                          );

                      ref
                          .read(myPageLogProvider.notifier)
                          .setUserLogs(newLogList);
                      ref
                          .read(myPageLogProvider.notifier)
                          .setCategory(categorys[i].name);
                      ref.read(myPageLogProvider.notifier).setCategoryIndex(i);
                    }

                    setState(() {});
                    context.pop();
                  },
                  child: Container(
                    width: 312,
                    height: 51,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          categorys[i].name,
                          style: SLTextStyle.Text_M_Medium?.copyWith(
                              color:
                                  i == 0 ? Colors.white : SLColor.neutral[50]),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        // TODO: 글 개수 연결
                        Text(categorys.length.toString()),
                        const SizedBox(
                          width: 12,
                        ),
                        if (categorys[i].public != 'public')
                          SizedBox(
                            width: 12,
                            child: SvgPicture.asset('assets/icons/padlock.svg'),
                          ),
                        Spacer(),
                        if (selectedIndex == i)
                          SvgPicture.asset('assets/icons/check_blue.svg'),
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        '카테고리 추가',
                        style: SLTextStyle.Text_M_Medium?.copyWith(
                            color: Colors.white),
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        '카테고리 편집',
                        style: SLTextStyle.Text_M_Medium?.copyWith(
                            color: Colors.white),
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
