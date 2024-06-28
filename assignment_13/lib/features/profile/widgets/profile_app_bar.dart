import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.isDark,
    required this.onMenuTap,
  });

  final bool isDark;
  final Function onMenuTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: Container(
        padding: const EdgeInsets.only(
          left: Sizes.size16,
        ),
        alignment: Alignment.centerLeft,
        child: const FaIcon(
          FontAwesomeIcons.globe,
        ),
      ),
      actions: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size6,
              ),
              child: FaIcon(
                FontAwesomeIcons.instagram,
                size: Sizes.size28,
              ),
            ),
            Gaps.h14,
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onMenuTap(),
              child: Container(
                padding: const EdgeInsets.only(
                  right: Sizes.size16,
                ),
                height: Sizes.size28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Sizes.size2,
                      width: Sizes.size24,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    Gaps.v8,
                    Container(
                      height: Sizes.size2,
                      width: Sizes.size14,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
