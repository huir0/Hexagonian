import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_log_notifier.dart';

final logRepliesProvider = FutureProvider.family<int, String>((ref, logId) async {
  final notifier = ref.read(myPageLogProvider.notifier);
  return await notifier.getLogReplies(logId);
});
