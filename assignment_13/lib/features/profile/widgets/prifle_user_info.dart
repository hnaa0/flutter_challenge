import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/profile/widgets/profile_button.dart';
import 'package:flutter/material.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v8,
                    const Text(
                      "GNAR",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      children: [
                        const Text(
                          "gnar_",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h10,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size8,
                            vertical: Sizes.size4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              ThemeColors.extraLightGray,
                            ).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                              Sizes.size14,
                            ),
                          ),
                          child: const Text(
                            "threads.net",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.lightGray,
                              ),
                              fontSize: Sizes.size10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v18,
                    const Text(
                      "I love treats💕",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: Sizes.size36,
                  backgroundColor: Color(
                    ThemeColors.black,
                  ),
                  foregroundImage: AssetImage("assets/images/avatar.jpg"),
                ),
              ],
            ),
            Gaps.v18,
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size1,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(
                          ThemeColors.lightGray,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: Sizes.size12,
                        foregroundImage: NetworkImage(
                            "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      ),
                    ),
                    Positioned(
                      right: -16,
                      child: Container(
                        padding: const EdgeInsets.all(
                          Sizes.size1,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(
                            ThemeColors.lightGray,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: Sizes.size12,
                          foregroundImage: NetworkImage(
                              "https://images.pexels.com/photos/3397939/pexels-photo-3397939.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.h28,
                const Text(
                  "2 followers",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.lightGray,
                    ),
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            Gaps.v18,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 1,
                  child: ProfileButton(
                    text: "Edit profile",
                  ),
                ),
                Gaps.h8,
                Flexible(
                  flex: 1,
                  child: ProfileButton(
                    text: "Share profile",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
