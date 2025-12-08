import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:toss_flutter/src/base_view.dart';
import 'package:toss_flutter/src/service/onboard/video_player_controller_service.dart';
import 'package:toss_flutter/src/service/permissions/permissions_service.dart';
import 'package:toss_flutter/src/view/common/toss_buttons.dart';
import 'package:toss_flutter/src/view/onboard/onboard_view_model.dart';
import 'package:toss_flutter/src/view/permission/permission_bottom_sheet.dart';
import 'package:toss_flutter/theme/res/palette.dart';
import 'package:video_player/video_player.dart';

part 'onboard_content.dart';

class OnBoardView extends StatelessWidget {
  OnBoardView({super.key});

  final PageController pageController = PageController();
  final List<OnBoardContent> contents = [
    OnBoardContent(
      titles: ["금융의 모든 것", "토스에서 간편하게"],
      richTitles: [],
      hints: [],
    ),
    OnBoardContent(
      animationAssetName: "money_shake",
      titles: ["평생 무료 송금"],
      richTitles: [],
      hints: ["누구에게 보내든"],
    ),
    OnBoardContent(
      animationAssetName: "hospital",
      titles: ["병원비 돌려받기"],
      richTitles: [],
      hints: [],
    ),
    OnBoardContent(
      animationAssetName: "running_machine",
      titles: ["걸으면서 돈 받는 만보기"],
      richTitles: [],
      hints: [],
    ),
    OnBoardContent(
      animationAssetName: "chart",
      titles: [],
      richTitles: [
        Text.rich(
          TextSpan(
            text: "토스",
            children: [
              TextSpan(
                text: "증권",
                style: TextStyle(color: Palette.tossRed),
              ),
            ],
          ),
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
      hints: ["주식을 간편하게"],
    ),
    OnBoardContent(
      animationAssetName: "bank",
      titles: [],
      richTitles: [
        Text.rich(
          TextSpan(
            text: "토스",
            children: [
              TextSpan(
                text: "뱅크",
                style: TextStyle(color: Palette.tossBlue),
              ),
            ],
          ),
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
      hints: ["1금융권 은행"],
    ),
  ];

  @override
  Widget build(BuildContext context) => BaseView(
    viewModel: OnBoardViewModel(
      context.read<VideoPlayerControllerService>(),
      context.read<PermissionsService>(),
    ),
    builder: (context, viewModel) {
      return BlocListener<OnBoardViewModel, OnBoardState>(
        listener: (context, state) async {
          switch (state) {
            case OnBoardOverlayBottomSheetState():
              PermissionBottomSheet.show(context, viewModel);
            case OnBoardDisposedState():
              final GoRouter router = GoRouter.of(context);
              final VideoPlayerControllerService videoService = context
                  .read<VideoPlayerControllerService>();
              if (!state.isRequiredPermissionsGranted) {
                await context.read<PermissionsService>().requestPermission();
              }
              videoService.dispose();
              router.go("/identify_verification");
          }
        },
        child: PageView.builder(
          controller: pageController,
          itemCount: contents.length,
          itemBuilder: (context, index) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: createContent(
                  context: context,
                  viewModel: viewModel,
                  onBoardContent: contents[index],
                  onPressed: () =>
                      viewModel.add(OnBoardShowPermissionBottomSheetEvent()),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
