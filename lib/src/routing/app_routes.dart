import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toss_flutter/src/view/onboard/onboard_view.dart';
import 'package:toss_flutter/src/view/splash/splash_view.dart';

class AppRoutes {
  const AppRoutes._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (_, __) => OnBoardView()),
      GoRoute(path: "/onboard", builder: (_, __) => OnBoardView()),
    ],
  );
}
