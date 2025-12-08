import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllerService extends Cubit<VideoPlayerController> {
  VideoPlayerControllerService() : super(VideoPlayerController.asset(""));

  bool isInitialized = false;

  Future<void> initialize(String assetPath) async {
    final VideoPlayerController videoPlayerController =
        VideoPlayerController.asset(
          assetPath,
          viewType: VideoViewType.platformView,
        );
    await videoPlayerController.initialize();
    isInitialized = true;
    emit(videoPlayerController);
  }

  void dispose() {
    if (isInitialized) {
      state.pause();
      state.dispose();
      isInitialized = false;
    }
  }
}
