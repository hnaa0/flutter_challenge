import 'package:assignment_13/common/main_navigation_screen.dart';
import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/authentication/views/login_screen.dart';
import 'package:assignment_13/features/authentication/views/signup_screen.dart';
import 'package:assignment_13/features/home/views/home_screen.dart';
import 'package:assignment_13/features/settings/views/privacy_screen.dart';
import 'package:assignment_13/features/settings/views/settings_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: HomeScreen.routeUrl,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;

        if (isLoggedIn) return null;

        // subloc = router의 sub location
        if (!isLoggedIn) {
          if (state.subloc != LoginScreen.routeUrl &&
              state.subloc != SignupScreen.routeUrl) {
            return LoginScreen.routeUrl;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: LoginScreen.routeUrl,
          name: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: SignupScreen.routeUrl,
          name: SignupScreen.routeName,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: "/:tab(home|search|activity|profile)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.params["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          path: SettingsScreen.routeUrl,
          name: SettingsScreen.routeName,
          builder: (context, state) => const SettingsScreen(),
          routes: [
            GoRoute(
              path: PrivacyScreen.routeUrl,
              name: PrivacyScreen.routeName,
              builder: (context, state) => const PrivacyScreen(),
            ),
          ],
        ),
      ],
    );
  },
);
