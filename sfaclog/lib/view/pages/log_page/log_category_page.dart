import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/log_category_model.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';

class LogCategoryPage extends ConsumerStatefulWidget {
  const LogCategoryPage({super.key});

  @override
  ConsumerState<LogCategoryPage> createState() => _LogCategoryPageState();
}

class _LogCategoryPageState extends ConsumerState<LogCategoryPage> {
  int selectedIndex = 0;
  List<LogCategoryModel> categoryList = [
    LogCategoryModel(name: '선택안함', log: '', user: '', public: 'public')
  ];

  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  @override
  void initState() {
    super.initState();
    initController();
  }

  void initController() async {
    List<RecordModel> categoryData = await _remoteDataSource.getTableData(
        tableName: 'category') as List<RecordModel>;
    setState(() {
      for (RecordModel item in categoryData) {
        LogCategoryModel data = LogCategoryModel.fromJson(item.data);
        categoryList.add(data);
      }
    });
    ref.read(logwriteProvider.notifier).setCategory(categoryList);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logwriteProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        title: Text(
          '카테고리 추가',
          style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                var newLogModel = state.logModel!
                    .copyWith(category: categoryList[selectedIndex].name);
                ref.read(logwriteProvider.notifier).setLog(newLogModel);
                context.pop();
              },
              child: Text(
                '확인',
                style: SLTextStyle(
                        style: SLStyle.Text_L_Regular, color: Colors.white)
                    .textStyle,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                state.categoryList[index].name,
                                style: SLTextStyle(
                                        style: SLStyle.Text_M_Medium,
                                        color: selectedIndex == index
                                            ? SLColor.primary
                                            : SLColor.neutral.shade50)
                                    .textStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              state.categoryList[index].public == 'public'
                                  ? const SizedBox()
                                  : SvgPicture.asset('assets/icons/lock.svg'),
                            ],
                          ),
                          selectedIndex == index
                              ? const Icon(
                                  Icons.check,
                                  color: SLColor.primary,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        height: 1,
                      ),
                    );
                  },
                  itemCount: state.categoryList.length),
              InkWell(
                onTap: () {
                  context.push('/log/write/category/add');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        '카테고리 추가',
                        style: SLTextStyle(
                          style: SLStyle.Text_M_Medium,
                        ).textStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
