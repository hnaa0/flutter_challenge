import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> searchUsers(
      {required String name}) async {
    final users = await _db
        .collection("users")
        .where("name", isGreaterThanOrEqualTo: name)
        .where("name",
            isLessThanOrEqualTo:
                "$name~") // name으로 시작하는 모든 문자열 name으로 시작하는 모든 문자열
        .get();

    return users;
  }
}

final searchRepo = Provider((ref) => SearchRepository());
