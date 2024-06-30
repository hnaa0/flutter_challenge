import 'dart:async';

import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
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
    required String contact,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        await _authRepo.signUp(
          contact: contact,
          password: password,
        );
      },
    );

    if (state.hasError) {
      showFirbaseErrorSnack(context, state.error);
    } else {
      context.go("/home");
    }
  }
}

final signupProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
