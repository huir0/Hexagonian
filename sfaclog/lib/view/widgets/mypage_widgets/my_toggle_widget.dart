import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common.dart';
import '../../../viewmodel/mypage_state_viewmodel/toggle_notifier.dart';

class MypageToggle extends ConsumerWidget {
  const MypageToggle({
    this.userId,
    this.toggleProvider,
    this.profileProvider,
  });
  final String? userId;
  final StateProvider<bool>? toggleProvider;
  final StateNotifierProvider<ToggleState, bool>? profileProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 40,
      height: 20,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: CupertinoSwitch(
          activeColor: SLColor.primary[100],
          value: userId == null
              ? ref.watch(toggleProvider!)
              : ref.watch(profileProvider!),
          onChanged: (value) {
            userId == null
                ? ref.read(toggleProvider!.notifier).state = value
                : ref
                    .read(profileProvider!.notifier)
                    .updateValue(value, userId!);
          },
        ),
      ),
    );
  }
}
