import 'dart:async';

import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/home/views/home_screen.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login({
    required String contact,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.signIn(
        contact: contact,
        password: password,
      );
    });
    if (state.hasError) {
      showFirbaseErrorSnack(context, state.error);
    } else {
      context.go(HomeScreen.routeUrl);
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
