import 'dart:async';

import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/user/models/user_profile_model.dart';
import 'package:assignment_13/features/user/repos/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  Future<UserProfileModel> build() async {
    _userRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);

    if (_authenticationRepository.isLoggedIn) {
      final uid = _authenticationRepository.user!.uid;
      final profile = await getUserProfile(uid);

      if (profile != null) {
        return profile;
      }
    }

    return UserProfileModel.empty();
  }

  Future<void> createProfile(
      {required UserCredential credential,
      required Map<String, String> formData}) async {
    state = const AsyncValue.loading();

    final profile = UserProfileModel(
      name: formData["name"]!,
      uid: credential.user!.uid,
      contact: formData["contact"]!,
      bio: "",
      isCertified: false,
      // hasAvatar: false,
    );

    await _userRepository.createProfile(profile);

    state = AsyncValue.data(profile);
  }

  Future<UserProfileModel?> getUserProfile(String userUid) async {
    // state = const AsyncValue.loading();

    final result = await _userRepository.findProfile(userUid);

    if (result != null) {
      final profile = UserProfileModel.fromJson(result);
      state = AsyncValue.data(profile);
      return profile;
    } else {
      return null;
    }
  }
}

final userProvider =
    AsyncNotifierProvider<UserProfileViewModel, UserProfileModel>(
  () => UserProfileViewModel(),
);
