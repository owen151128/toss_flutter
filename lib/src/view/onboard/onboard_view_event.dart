part of 'onboard_view_model.dart';

abstract class OnBoardEvent {}

class OnBoardPlayVideoEvent extends OnBoardEvent {}

class OnBoardStopVideoEvent extends OnBoardEvent {}

class OnBoardShowPermissionBottomSheetEvent extends OnBoardEvent {}

class OnBoardDisposeEvent extends OnBoardEvent {}
