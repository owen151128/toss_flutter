import 'package:bloc/bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';
import 'package:video_player/video_player.dart';

part 'splash_view_event.dart';
part 'splash_view_state.dart';

class SplashViewModel extends BaseViewModel<SplashEvent, SplashState> {
  SplashViewModel() : super(SplashInitializingState()) {
    on<TossInitializeEvent>(onTossInitializeEvent);
  }

  Future<void> onTossInitializeEvent(
    TossInitializeEvent event,
    Emitter<SplashState> emit,
  ) async {
    await event.videoPlayerController.initialize();
    event.videoPlayerController.play();
    await Future.delayed(
      Duration(
        seconds: event.videoPlayerController.value.duration.inSeconds + 1,
      ),
    );
    emit(SplashInitializedState());
  }
}
