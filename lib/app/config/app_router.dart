import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticats/presentation/index.dart';

part 'app_router.g.dart';

class RoutePath {
  // Home
  static const String home = '/home';

  // Auth
  static const String login = '/login';

  // Sign In
  static const String signIn = '/sign_in';
  static const String registerProfile = 'register_profile';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: RoutePath.login,
      navigatorKey: rootNavigatorKey,
      routes: [
        // Home
        GoRoute(
          path: RoutePath.home,
          builder: (context, state) => const MainPage(),
        ),

        // Auth
        GoRoute(
          path: RoutePath.login,
          builder: (context, state) => const LoginPage(),
        ),

        // Sign In
        GoRoute(
          path: RoutePath.signIn,
          builder: (context, state) => const Placeholder(),
          routes: [
            GoRoute(
              path: RoutePath.registerProfile,
              name: RoutePath.registerProfile,
              builder: (context, state) => const RegisterProfilePage(),
            ),
          ],
        ),
      ],
    );
  }
}
