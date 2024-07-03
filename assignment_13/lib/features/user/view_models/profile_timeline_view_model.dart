import 'dart:async';

import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/write_thread/models/thread_model.dart';
import 'package:assignment_13/features/write_thread/repos/thread_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileTimelineViewModel extends StreamNotifier<List<ThreadModel>> {
  @override
  Stream<List<ThreadModel>> build() {
    return _fetchUserThreads();
  }

  Stream<List<ThreadModel>> _fetchUserThreads() {
    final user = ref.read(authRepo).user;
    // final result = _repository.streamUserThreads(user!.uid);
    final result = ref.read(threadRepo).streamUserThreads(user!.uid);
    return result;
  }
}

final profileTimelineProvider =
    StreamNotifierProvider<ProfileTimelineViewModel, List<ThreadModel>>(
  () => ProfileTimelineViewModel(),
);
