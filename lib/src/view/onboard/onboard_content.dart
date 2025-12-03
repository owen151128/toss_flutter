part of 'onboard_view.dart';

class OnBoardContent {
  const OnBoardContent({
    this.videoAssetPath,
    this.animationAssetName,
    required this.titles,
    required this.richTitles,
    required this.hints,
  });

  final String? videoAssetPath;
  final String? animationAssetName;
  final List<String> titles;
  final List<Text> richTitles;
  final List<String> hints;
}

Widget createContent({
  required BuildContext context,
  required OnBoardViewModel viewModel,
  required OnBoardContent onBoardContent,
  required void Function()? onPressed,
}) {
  late final Widget mainContent;
  late final List<Widget> titles;
  if (onBoardContent.videoAssetPath != null) {
    final VideoPlayerController videoPlayerController =
        VideoPlayerController.asset(
          onBoardContent.videoAssetPath!,
          viewType: VideoViewType.platformView,
        );
    mainContent = VideoPlayer(videoPlayerController);
    viewModel.add(OnBoardPlayVideoEvent(videoPlayerController));
  } else {
    mainContent = Lottie.asset(
      "assets/lotties/${onBoardContent.animationAssetName ?? "error_default"}.json",
    );
  }
  if (onBoardContent.richTitles.isEmpty) {
    titles = List.generate(
      onBoardContent.titles.length,
      (index) => Text(
        onBoardContent.titles[index],
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  } else {
    titles = onBoardContent.richTitles;
  }
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [
        Spacer(),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          child: mainContent,
        ),
        Spacer(),
        ...titles,
        ...List.generate(
          onBoardContent.hints.length,
          (index) => Text(
            onBoardContent.hints[index],
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ),
        Spacer(),
        _createButton(context, onPressed),
      ],
    ),
  );
}

Widget _createButton(BuildContext context, void Function()? onPressed) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(padding: const EdgeInsets.all(18), child: Text("다음")),
      ),
    ),
  );
}
