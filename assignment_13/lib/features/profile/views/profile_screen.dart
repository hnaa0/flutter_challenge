import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/common/widgets/post_card.dart';
import 'package:assignment_13/features/profile/widgets/profile_replies.dart';
import 'package:assignment_13/features/settings/views/settings_screen.dart';
import 'package:assignment_13/models/profiles.dart';
import 'package:assignment_13/features/profile/widgets/profile_persistent_tab_bar.dart';
import 'package:assignment_13/features/profile/widgets/profile_button.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  void _onMenuTap() {
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
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
                      onTap: _onMenuTap,
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
                              color: isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            Gaps.v8,
                            Container(
                              height: Sizes.size2,
                              width: Sizes.size14,
                              color: isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SliverToBoxAdapter(
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
                          foregroundImage:
                              AssetImage("assets/images/avatar.jpg"),
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
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProfilePersistentTabBar(
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size12,
              ),
              child: ListView.separated(
                itemCount: profilesThreads.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    item: profilesThreads[index],
                    isMine: true,
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: Sizes.size1,
                  color: isDarkMode(context)
                      ? const Color(ThemeColors.darkGray)
                      : const Color(
                          ThemeColors.extraLightGray,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size18,
              ),
              child: ListView.builder(
                itemCount: profilesReplies.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostCard(
                        item: profilesReplies[index],
                        isMine: false,
                      ),
                      ProfileReplies(replyInfo: profilesReplies[index].reply!),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
