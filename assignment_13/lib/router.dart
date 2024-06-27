import 'package:assignment_13/common/main_navigation_screen.dart';
import 'package:assignment_13/features/home/views/home_screen.dart';
import 'package:assignment_13/features/settings/views/privacy_screen.dart';
import 'package:assignment_13/features/settings/views/settings_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: HomeScreen.routeUrl,
  routes: [
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
