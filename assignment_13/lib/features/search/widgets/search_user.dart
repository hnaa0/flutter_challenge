import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/common/widgets/certification_mark.dart';
import 'package:assignment_13/features/user/models/user_profile_model.dart';
import 'package:flutter/material.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({
    super.key,
    required this.userInfo,
  });

  final UserProfileModel userInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.cyan,
          ),
        ],
      ),
      title: Row(
        children: [
          Text(
            userInfo.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h4,
          if (userInfo.isCertified) const CertificationMark(),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userInfo.bio),
          Gaps.v4,
          // Text(
          //   "${NumberFormat.compact().format(follower)} followers",
          //   style: const TextStyle(
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          const Text("followers"),
        ],
      ),
      trailing: Container(
        width: 100,
        height: 30,
        alignment: Alignment.center,
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
          "Follow",
          style: TextStyle(
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
    // ListTile(
    //   leading: Column(
    //     children: [
    //       CircleAvatar(
    //         foregroundImage: NetworkImage(
    //           avatar,
    //         ),
    //         backgroundColor: Colors.white,
    //       ),
    //     ],
    //   ),
    //   title: Row(
    //     children: [
    //       Text(
    //         account,
    //         style: const TextStyle(
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //       Gaps.h4,
    //       if (isCertified) const CertificationMark(),
    //     ],
    //   ),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         name,
    //         overflow: TextOverflow.ellipsis,
    //       ),
    //       Gaps.v4,
    //       Text(
    //         "${NumberFormat.compact().format(follower)} followers",
    //         style: const TextStyle(
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //     ],
    //   ),
    //   trailing: Container(
    //     width: 100,
    //     height: 30,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(
    //         Sizes.size10,
    //       ),
    //       border: Border.all(
    //         color: const Color(
    //           ThemeColors.extraLightGray,
    //         ),
    //       ),
    //     ),
    //     child: const Text(
    //       "Follow",
    //       style: TextStyle(
    //         fontSize: Sizes.size14,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //   ),
    //   contentPadding: EdgeInsets.zero,
    // );
  }
}
