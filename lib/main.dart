import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toss_flutter/my_bloc_observer.dart';
import 'package:toss_flutter/src/routing/app_routes.dart';
import 'package:toss_flutter/theme/res/palette.dart';

import 'src/service/onboard/video_player_controller_service.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => VideoPlayerControllerService())],
      child: const TossApp(),
    ),
  );
}

class TossApp extends StatelessWidget {
  const TossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      title: 'Toss',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.tossBlue),
        primaryColor: Palette.tossBlue,
      ),
    );
  }
}
