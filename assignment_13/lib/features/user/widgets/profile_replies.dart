import 'package:assignment_13/common/widgets/post_card_user_avatar.dart';
import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileReplies extends StatelessWidget {
  const ProfileReplies({
    super.key,
    required this.replyInfo,
  });

  final Map<String, dynamic> replyInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostCardUserAvatar(
          avatarImg: replyInfo["avatarImg"],
          isMine: true,
        ),
        Gaps.h18,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    replyInfo["account"],
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    replyInfo["time"],
                    style: const TextStyle(
                      color: Color(
                        ThemeColors.darkGray,
                      ),
                    ),
                  ),
                  Gaps.h14,
                  const FaIcon(
                    FontAwesomeIcons.ellipsis,
                    size: Sizes.size18,
                  ),
                  Gaps.h6,
                ],
              ),
              Gaps.v6,
              Text(
                replyInfo["text"],
                style: const TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
