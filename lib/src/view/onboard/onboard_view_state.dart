part of 'onboard_view_model.dart';

abstract class OnBoardState {}

class OnBoardPlayingVideoState extends OnBoardState {}

class OnBoardStopedVideoState extends OnBoardState {}

class OnBoardOverlayBottomSheetState extends OnBoardState {}

class OnBoardDisposedState extends OnBoardState {
  OnBoardDisposedState(this.isRequiredPermissionsGranted);

  final bool isRequiredPermissionsGranted;
}
