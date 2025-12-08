import 'package:go_router/go_router.dart';
import 'package:toss_flutter/src/view/identify/identify_verification_view.dart';
import 'package:toss_flutter/src/view/onboard/onboard_view.dart';
import 'package:toss_flutter/src/view/splash/splash_view.dart';

class AppRoutes {
  const AppRoutes._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (_, __) => SplashView()),
      GoRoute(path: "/onboard", builder: (_, __) => OnBoardView()),
      GoRoute(
        path: "/identify_verification",
        builder: (_, __) => IdentifyVerificationView(),
      ),
    ],
  );
}
