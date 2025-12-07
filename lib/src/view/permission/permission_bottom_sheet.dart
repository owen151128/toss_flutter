import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toss_flutter/src/service/permissions/permissions_service.dart';
import 'package:toss_flutter/src/view/common/toss_buttons.dart';
import 'package:toss_flutter/theme/res/palette.dart';

class PermissionBottomSheet {
  const PermissionBottomSheet._();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "토스를 시작하려면 권한이 필요해요",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              _createPermissionItem(
                icons: CupertinoIcons.app_badge,
                iconColor: Palette.tossRed,
                title: "알림",
                child: Text(
                  "ARS 인증번호를 받거나, 더치페이를 요청할 때 알림을 받아요.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              _createPermissionItem(
                icons: CupertinoIcons.book,
                iconColor: Palette.tossBlue,
                title: "연락처",
                child: Text(
                  "주소록에 저장된 사람들에게 무료로 송금하고, 프로필 사진을 불러와요. 다양한 혜택을 공유하거나 초대 메시지를 보낼 수 있어요.\n",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _createPermissionItem(
                icons: CupertinoIcons.app_badge,
                iconColor: Colors.transparent,
                title: "",
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(64),
                  child: Row(
                    children: [
                      Text(
                        "개인정보 처리 방침",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.grey, size: 14),
                    ],
                  ),
                ),
              ),
              Spacer(),
              TossButtons.createButton(context, "계속하기", () async {
                GoRouter.of(context).pop();
                context.read<PermissionsService>().requestPermission();
              }),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

  static Widget _createPermissionItem({
    required IconData icons,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(
              icons,
              color: iconColor == Colors.transparent
                  ? Colors.transparent
                  : Colors.white,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
