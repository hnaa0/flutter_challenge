import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCardUserAvatar extends ConsumerWidget {
  const PostCardUserAvatar({
    super.key,
    required this.avatarImg,
    required this.isMine,
  });

  final String avatarImg;
  final bool isMine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        isMine
            ? const CircleAvatar(
                // foregroundImage: AssetImage(
                //   avatarImg,
                // ),
                backgroundColor: Colors.amber,
                radius: Sizes.size24,
                child: Text("it's mine"),
              )
            : const CircleAvatar(
                // foregroundImage: NetworkImage(
                //   avatarImg,
                // ),
                backgroundColor: Colors.blue,
                radius: Sizes.size24,
                child: Text("it's not mine"),
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
                    color:
                        isDark ? const Color(ThemeColors.black) : Colors.white),
                color: isDark
                    ? const Color(ThemeColors.extraLightGray)
                    : const Color(ThemeColors.black),
              ),
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: Sizes.size10,
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
