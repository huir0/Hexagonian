import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common.dart';

class MypageToggle extends ConsumerWidget {
  const MypageToggle({
    super.key,
    required this.toggleProvider,
  });
  final StateProvider<bool> toggleProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 40,
      height: 20,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: CupertinoSwitch(
          activeColor: SLColor.primary[100],
          value: ref.watch(toggleProvider),
          onChanged: (value) {
             ref.read(toggleProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}