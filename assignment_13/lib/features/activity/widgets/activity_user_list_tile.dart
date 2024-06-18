import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/models/activities.dart';
import 'package:assignment_13/features/activity/activity_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityUserListTile extends StatelessWidget {
  const ActivityUserListTile({
    super.key,
    required this.userInfo,
  });

  final Activity userInfo;

  String _activityTypeText(ActivityType type) {
    if (type == ActivityType.mention) {
      return "Mentioned you";
    } else if (type == ActivityType.follow) {
      return "Followed you";
    } else {
      return userInfo.post;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        right: Sizes.size10,
      ),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: Color(
                ThemeColors.lightGray,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userInfo.profileImg),
              backgroundColor: Colors.amber,
            ),
          ),
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(
                Sizes.size4,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
                color: userInfo.type.color,
              ),
              child: FaIcon(
                userInfo.type.iconData,
                size: Sizes.size10,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          Text(
            userInfo.account,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h8,
          Text(
            userInfo.time,
            style: const TextStyle(
              color: Color(
                ThemeColors.darkGray,
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            _activityTypeText(userInfo.type),
            style: const TextStyle(
              color: Color(
                ThemeColors.darkGray,
              ),
              fontSize: Sizes.size16,
            ),
          ),
          if (userInfo.text != "")
            Text(
              userInfo.text,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
      trailing: userInfo.type == ActivityType.follow
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size18,
                vertical: Sizes.size4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Sizes.size10,
                ),
                border: Border.all(
                  color: const Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              ),
              child: const Text(
                "Following",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w700,
                  color: Color(
                    ThemeColors.lightGray,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
