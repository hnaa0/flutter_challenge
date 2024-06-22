import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCardUserAvatar extends StatelessWidget {
  const PostCardUserAvatar({
    super.key,
    required this.avatarImg,
    required this.isMine,
  });

  final String avatarImg;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        isMine
            ? CircleAvatar(
                foregroundImage: AssetImage(
                  avatarImg,
                ),
                backgroundColor: const Color(
                  ThemeColors.black,
                ),
                radius: Sizes.size24,
              )
            : CircleAvatar(
                foregroundImage: NetworkImage(
                  avatarImg,
                ),
                backgroundColor: const Color(
                  ThemeColors.black,
                ),
                radius: Sizes.size24,
              ),
        if (!isMine)
          Positioned(
            bottom: -Sizes.size2,
            right: -Sizes.size4,
            child: Container(
              alignment: Alignment.center,
              width: Sizes.size24,
              height: Sizes.size24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: Sizes.size2,
                    color: isDarkMode(context)
                        ? const Color(ThemeColors.black)
                        : Colors.white),
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraLightGray)
                    : const Color(ThemeColors.black),
              ),
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: Sizes.size10,
                color: isDarkMode(context) ? Colors.black : Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}