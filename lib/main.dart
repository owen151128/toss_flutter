import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toss_flutter/my_bloc_observer.dart';
import 'package:toss_flutter/src/routing/app_routes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const TossApp());
}

class TossApp extends StatelessWidget {
  const TossApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color tossMainColor = Color.fromARGB(100, 0, 64, 255);

    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      title: 'Toss',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: tossMainColor),
      ),
    );
  }
}
