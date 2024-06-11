import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCardUserAvatar extends StatelessWidget {
  const PostCardUserAvatar({
    super.key,
    required this.avatarImg,
  });

  final String avatarImg;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            avatarImg,
          ),
          radius: Sizes.size24,
        ),
        Positioned(
          bottom: -Sizes.size2,
          right: -Sizes.size4,
          child: Container(
            alignment: Alignment.center,
            width: Sizes.size24,
            height: Sizes.size24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: Sizes.size2, color: Colors.white),
              color: const Color(ThemeColors.black),
            ),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size10,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
