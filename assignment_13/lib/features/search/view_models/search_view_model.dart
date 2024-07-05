import 'dart:async';

import 'package:assignment_13/features/search/repos/search_repository.dart';
import 'package:assignment_13/features/user/models/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends AsyncNotifier<List<UserProfileModel>> {
  late final SearchRepository _repository;
  List<UserProfileModel> _userList = [];

  @override
  FutureOr<List<UserProfileModel>> build() async {
    _repository = ref.read(searchRepo);
    _userList = await searchUsers();
    return _userList;
  }

  Future<List<UserProfileModel>> searchUsers({String? name}) async {
    final result = await _repository.searchUsers(name: name ?? "");
    final users = result.docs
        .map((doc) => UserProfileModel.fromJson(doc.data()))
        .toList();

    return users;
  }

  Future<void> updateUserList(String name) async {
    final result = await searchUsers(name: name);
    state = AsyncValue.data(result);
  }
}

final searchProvider =
    AsyncNotifierProvider<SearchViewModel, List<UserProfileModel>>(
  () => SearchViewModel(),
);
