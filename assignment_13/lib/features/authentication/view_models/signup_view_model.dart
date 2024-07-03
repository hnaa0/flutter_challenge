import 'dart:async';

import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/user/view_models/user_profile_view_model.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signup({
    required Map<String, String> data,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();

    final users = ref.read(userProvider.notifier);

    state = await AsyncValue.guard(
      () async {
        final userCredential = await _authRepo.signUp(
          contact: data["contact"]!,
          password: data["password"]!,
        );

        await users.createProfile(credential: userCredential, formData: data);
      },
    );

    if (state.hasError) {
      if (!context.mounted) return;
      showFirbaseErrorSnack(context, state.error);
    } else {
      if (!context.mounted) return;
      context.go("/home");
    }
  }
}

final signupProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
