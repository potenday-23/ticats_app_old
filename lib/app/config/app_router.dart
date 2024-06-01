import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ticats/presentation/main/view/main_page.dart';

part 'app_router.g.dart';

class RoutePath {
  // Home
  static const String home = '/home';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: RoutePath.home,
      navigatorKey: rootNavigatorKey,
      routes: [
        // Home
        GoRoute(
          path: RoutePath.home,
          builder: (context, state) => const MainPage(),
        ),
      ],
    );
  }
}
