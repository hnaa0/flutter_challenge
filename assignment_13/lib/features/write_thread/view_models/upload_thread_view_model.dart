import 'dart:async';
import 'dart:io';

import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/write_thread/models/thread_model.dart';
import 'package:assignment_13/features/write_thread/repos/thread_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadThreadViewModel extends AsyncNotifier<void> {
  late final ThreadRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(threadRepo);
  }

  Future<void> uploadThread({
    required List<File> images,
    required String content,
    required BuildContext context,
  }) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();

    if (state.isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uploading thread...")),
      );
    }

    state = await AsyncValue.guard(() async {
      List<String> downloadUrls = [];

      if (images.isNotEmpty) {
        final tasks = _repository.uploadThread(
          images,
          user!.uid,
        );

        downloadUrls = await Future.wait(
          tasks.map(
            (task) async {
              final snapshot = await task.whenComplete(() => {});
              return await snapshot.ref.getDownloadURL();
            },
          ),
        );
      }

      await _repository.saveThread(ThreadModel(
        id: "",
        content: content,
        images: downloadUrls,
        creatorUid: user!.uid,
        creator: "anonymous",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        liked: 0,
        replies: [],
      ));
    });
  }
}

final uploadThreadProvider = AsyncNotifierProvider<UploadThreadViewModel, void>(
  () => UploadThreadViewModel(),
);
