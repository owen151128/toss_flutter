import 'package:bloc/bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';
import 'package:toss_flutter/src/service/onboard/video_player_controller_service.dart';

part 'onboard_view_event.dart';
part 'onboard_view_state.dart';

class OnBoardViewModel extends BaseViewModel<OnBoardEvent, OnBoardState> {
  OnBoardViewModel(this.videoService) : super(OnBoardStopedVideoState()) {
    on<OnBoardPlayVideoEvent>(onBoardPlayVideoEvent);
    on<OnBoardStopVideoEvent>(onBoardStopedVideoEvent);
  }

  final VideoPlayerControllerService videoService;

  Future<void> onBoardPlayVideoEvent(
    OnBoardPlayVideoEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    videoService.state.setLooping(true);
    videoService.state.play();
    emit(OnBoardPlayingVideoState());
  }

  Future<void> onBoardStopedVideoEvent(
    OnBoardStopVideoEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    videoService.state.pause();
    videoService.state.dispose();
  }
}
