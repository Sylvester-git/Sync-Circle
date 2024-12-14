import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:synccircle/ui/features/home/home.dart';

import 'cutompagetransition.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();
// final _shellNavigationKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigationKey,
    routes: <RouteBase>[
      //! Home
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return customPageTransition(
            child: const HomePage(),
            key: state.pageKey,
            stransitionDuration: 1,
          );
        },
      ),
    ],
  );
}
