import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllerService extends Cubit<VideoPlayerController> {
  VideoPlayerControllerService() : super(VideoPlayerController.asset(""));

  Future<void> initialize(String assetPath) async {
    final VideoPlayerController videoPlayerController =
        VideoPlayerController.asset(
          assetPath,
          viewType: VideoViewType.platformView,
        );
    await videoPlayerController.initialize();
    emit(videoPlayerController);
  }
}
