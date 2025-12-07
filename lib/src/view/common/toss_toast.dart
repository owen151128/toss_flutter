import 'package:flutter/material.dart';
import 'package:toss_flutter/theme/res/palette.dart';

enum TossToastType { error, warning, message }

class TossToast {
  const TossToast._();

  static void show(
    BuildContext context,
    TossToastType toastType,
    String message,
  ) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    final controller = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 250),
    );

    final fadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    late final List<Widget> iconAndMargin;
    switch (toastType) {
      case TossToastType.error:
        iconAndMargin = [
          Icon(Icons.warning, color: Palette.tossRed),
          SizedBox(width: 12),
        ];
        break;
      case TossToastType.warning:
        iconAndMargin = [
          Icon(Icons.warning, color: Colors.amber),
          SizedBox(width: 12),
        ];
        break;
      case TossToastType.message:
        iconAndMargin = [];
    }

    entry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.15,
          ),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: toastType == TossToastType.message
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    ...iconAndMargin,
                    Text(
                      message,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    controller.forward();

    Future.delayed(Duration(seconds: 2)).then((_) async {
      await controller.reverse();
      entry.remove();
      controller.dispose();
    });
  }
}
