import 'dart:async';

import 'package:assignment_13/features/write_thread/models/thread_model.dart';
import 'package:assignment_13/features/write_thread/repos/thread_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTimelineViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadRepository _repository;
  List<ThreadModel> _threadsList = [];

  @override
  FutureOr<List<ThreadModel>> build() async {
    _repository = ref.read(threadRepo);
    _threadsList = await _fetchThreads(lastItemCreatedAt: null);

    return _threadsList;
  }

  Future<List<ThreadModel>> _fetchThreads({int? lastItemCreatedAt}) async {
    final result =
        await _repository.fetchThreads(lastItemCreatedAt: lastItemCreatedAt);
    final threads =
        result.docs.map((item) => ThreadModel.fromJson(json: item.data()));

    return threads.toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final threads = await _fetchThreads(lastItemCreatedAt: null);
    _threadsList = threads;
    state = AsyncValue.data(threads);
  }
}

final homeTimelineProvider =
    AsyncNotifierProvider<HomeTimelineViewModel, List<ThreadModel>>(
  () => HomeTimelineViewModel(),
);
