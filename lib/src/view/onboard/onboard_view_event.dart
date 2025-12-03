part of 'onboard_view_model.dart';

abstract class OnBoardEvent {}

class OnBoardPlayVideoEvent extends OnBoardEvent {
  final VideoPlayerController videoPlayerController;

  OnBoardPlayVideoEvent(this.videoPlayerController);
}

class OnBoardStopVideoEvent extends OnBoardEvent {}
