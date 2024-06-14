import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/common/widgets/certification_mark.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({
    super.key,
    required this.avatar,
    required this.account,
    required this.name,
    required this.follower,
    required this.isCertified,
  });

  final String avatar;
  final String account;
  final String name;
  final int follower;
  final bool isCertified;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              avatar,
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          Text(
            account,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h4,
          if (isCertified) const CertificationMark(),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
          Gaps.v4,
          Text(
            "${NumberFormat.compact().format(follower)} followers",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      trailing: Container(
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
          "Follow",
          style: TextStyle(
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
