import 'package:flutter/material.dart';
import 'package:toss_flutter/src/base_view.dart';
import 'package:toss_flutter/src/view/common/toss_buttons.dart';
import 'package:toss_flutter/src/view/identify/identify_verification_view_model.dart';
import 'package:toss_flutter/theme/res/palette.dart';

class IdentifyVerificationView extends StatelessWidget {
  const IdentifyVerificationView({super.key});

  @override
  Widget build(BuildContext context) => BaseView(
    viewModel: IdentifyVerificationViewModel(),
    builder: (context, viewModel) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "본인 인증을 위해 문자를 보내주세요",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "내용은 토스가 미리 써놨으니 [문자 보내기]만 눌러주세요.",
                          style: TextStyle(
                            color: Palette.tossGrey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                    ],
                  ),
                  Spacer(),
                  FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.scaleDown,
                    child: Image.asset("assets/images/mo_verify_image.png"),
                  ),
                  Spacer(),
                  TossButtons.createButton(
                    context,
                    "문자 보내기",
                    () => viewModel.add(
                      IdentifyVerificationMoVerifyButtonClickEvent(),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(64),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "내 명의의 휴대폰이 아니라면?",
                          style: TextStyle(
                            color: Palette.tossGrey,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Palette.tossGrey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
