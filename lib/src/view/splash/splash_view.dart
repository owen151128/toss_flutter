import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toss_flutter/src/base_view.dart';
import 'package:toss_flutter/src/service/onboard/video_player_controller_service.dart';
import 'package:toss_flutter/src/view/splash/splash_view_model.dart';
import 'package:video_player/video_player.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(
        "assets/videos/toss_splash.mp4",
        viewType: VideoViewType.platformView,
      );

  @override
  void dispose() async {
    super.dispose();
    await videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseView(
    viewModel: SplashViewModel(context.read<VideoPlayerControllerService>()),
    builder: (context, viewModel) {
      viewModel.add(
        TossInitializeEvent(videoPlayerController: videoPlayerController),
      );
      return BlocListener<SplashViewModel, SplashState>(
        listener: (context, state) {
          if (state is SplashInitializedState) {
            context.go("/onboard");
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          ),
        ),
      );
    },
  );
}
