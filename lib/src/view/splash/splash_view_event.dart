part of 'splash_view_model.dart';

abstract class SplashEvent {}

class TossInitializeEvent extends SplashEvent {
  final VideoPlayerController videoPlayerController;

  TossInitializeEvent({required this.videoPlayerController});
}
