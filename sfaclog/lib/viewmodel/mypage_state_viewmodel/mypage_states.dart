import 'package:flutter_riverpod/flutter_riverpod.dart';

final proposalStateProvider = StateProvider<bool>((ref) => false);
final resumePublicProvider = StateProvider<bool>((ref) => false);
final chattingNotificationProvider = StateProvider<bool>((ref) => false);
final logNotificationProvider = StateProvider<bool>((ref) => false);
final qnaNotificationProvider = StateProvider<bool>((ref) => false);
final profileFollowNotificationProvider = StateProvider<bool>((ref) => false);
