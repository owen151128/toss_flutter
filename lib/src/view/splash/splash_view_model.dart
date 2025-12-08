import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';
import 'package:toss_flutter/src/service/onboard/video_player_controller_service.dart';
import 'package:video_player/video_player.dart';

part 'splash_view_event.dart';
part 'splash_view_state.dart';

class SplashViewModel extends BaseViewModel<SplashEvent, SplashState> {
  SplashViewModel(this.videoPlayerControllerService)
    : super(SplashInitializingState()) {
    on<TossInitializeEvent>(onTossInitializeEvent);
  }

  final VideoPlayerControllerService videoPlayerControllerService;

  Future<void> onTossInitializeEvent(
    TossInitializeEvent event,
    Emitter<SplashState> emit,
  ) async {
    await event.videoPlayerController.initialize();
    event.videoPlayerController.play();
    await Future.wait([
      videoPlayerControllerService.initialize("assets/videos/toss_splash.mp4"),
      Future.delayed(
        Duration(seconds: event.videoPlayerController.value.duration.inSeconds),
      ),
    ]);
    emit(SplashInitializedState());
  }
}
