import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_listtile_widget.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/main_title.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/more_button.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';

class SpecupReviewSection extends ConsumerWidget {
  const SpecupReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var logModelListState = ref.watch(logProvider).logModelList;

    if (logModelListState == []) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTitle(title: '스팩업 회고록'),
              MoreButton(onPressed: null),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 257,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push('/log/read/${logModelListState[index].id}');
                },
                child: LogListTileWidget(
                  logData: logModelListState![index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
