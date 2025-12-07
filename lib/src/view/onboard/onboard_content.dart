part of 'onboard_view.dart';

class OnBoardContent {
  const OnBoardContent({
    this.animationAssetName,
    required this.titles,
    required this.richTitles,
    required this.hints,
  });

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
  if (onBoardContent.animationAssetName == null) {
    mainContent = VideoPlayer(
      context.read<VideoPlayerControllerService>().state,
    );
    viewModel.add(OnBoardPlayVideoEvent());
  } else {
    mainContent = Lottie.asset(
      "assets/lotties/${onBoardContent.animationAssetName!}.json",
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
        TossButtons.createButton(context, "다음", onPressed),
      ],
    ),
  );
}
