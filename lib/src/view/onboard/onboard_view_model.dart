import 'package:bloc/bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';
import 'package:video_player/video_player.dart';

part 'onboard_view_event.dart';
part 'onboard_view_state.dart';

class OnBoardViewModel extends BaseViewModel<OnBoardEvent, OnBoardState> {
  OnBoardViewModel() : super(OnBoardStopedVideoState()) {
    on<OnBoardPlayVideoEvent>(onBoardPlayingVideoEvent);
    on<OnBoardStopVideoEvent>(onBoardStopedVideoEvent);
  }

  VideoPlayerController? videoPlayerController;

  Future<void> onBoardPlayingVideoEvent(
    OnBoardPlayVideoEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    videoPlayerController = event.videoPlayerController;
    if (videoPlayerController == null) {
      return;
    }
    await videoPlayerController!.initialize();
    videoPlayerController!.setLooping(true);
    videoPlayerController!.play();
    emit(OnBoardPlayingVideoState());
  }

  Future<void> onBoardStopedVideoEvent(
    OnBoardStopVideoEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    if (videoPlayerController == null) {
      return;
    }
    videoPlayerController!.pause();
    videoPlayerController!.dispose();
  }
}
