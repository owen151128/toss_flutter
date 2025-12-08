import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';
import 'package:toss_flutter/src/service/onboard/video_player_controller_service.dart';
import 'package:toss_flutter/src/service/permissions/permissions_service.dart';

part 'onboard_view_event.dart';

part 'onboard_view_state.dart';

class OnBoardViewModel extends BaseViewModel<OnBoardEvent, OnBoardState> {
  OnBoardViewModel(this.videoService, this.permissionsService)
    : super(OnBoardStopedVideoState()) {
    on<OnBoardPlayVideoEvent>(onBoardPlayVideoEvent);
    on<OnBoardStopVideoEvent>(onBoardStopedVideoEvent);
    on<OnBoardShowPermissionBottomSheetEvent>(
      onBoardShowPermissionBottomSheetEvent,
    );
    on<OnBoardDisposeEvent>(onBoardDisposeEvent);
  }

  final VideoPlayerControllerService videoService;
  final PermissionsService permissionsService;

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
    videoService.dispose();
    emit(OnBoardStopedVideoState());
  }

  Future<void> onBoardShowPermissionBottomSheetEvent(
    OnBoardShowPermissionBottomSheetEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    // 필요 권한이 모두 흭득되어 있으면 dispose, 아닌 경우 bottom sheet 보여주기
    // 이후 bottom sheet 가 끝나면 onBoardDisposeEvent 가 다시 발생
    if (await permissionsService.isRequiredPermissionsGranted()) {
      add(OnBoardDisposeEvent());
    } else {
      emit(OnBoardOverlayBottomSheetState());
    }
  }

  Future<void> onBoardDisposeEvent(
    OnBoardDisposeEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    // 퍼미션 요청이 필요한지 확인해서 OnBoardDisposedState 변경
    // true : 불필요, false : 필요
    // false 인 경우에만 권한 요청 시도
      emit(OnBoardDisposedState(await permissionsService.isRequiredPermissionsGranted()));
  }
}
