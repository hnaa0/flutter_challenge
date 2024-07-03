import 'dart:io';

import 'package:assignment_13/features/write_thread/models/thread_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreadRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  List<UploadTask> uploadThread(List<File> images, String uid) {
    List<UploadTask> uploadTasks = [];

    for (var image in images) {
      final fileRef = _storage.ref().child(
          "/images/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}");

      uploadTasks.add(fileRef.putFile(image));
    }

    return uploadTasks;
  }

  Future<void> saveThread(ThreadModel data) async {
    await _db.collection("threads").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchThreads(
      {int? lastItemCreatedAt}) {
    final query =
        _db.collection("threads").orderBy("createdAt", descending: true);

    return query.get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserThreads(String uid) {
    final query = _db
        .collection("threads")
        .where("creatorUid", isEqualTo: uid)
        .orderBy("createdAt", descending: true)
        .limit(5);

    return query.get();
  }

  Stream<List<ThreadModel>> streamUserThreads(String userId) {
    return _db
        .collection("threads")
        .where("creatorUid", isEqualTo: userId)
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ThreadModel.fromJson(json: doc.data()))
            .toList());
  }
}

final threadRepo = Provider((ref) => ThreadRepository());
