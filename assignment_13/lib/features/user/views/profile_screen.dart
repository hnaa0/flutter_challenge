import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/common/widgets/post_card.dart';
import 'package:assignment_13/features/user/view_models/profile_timeline_view_model.dart';
import 'package:assignment_13/features/user/view_models/user_profile_view_model.dart';
import 'package:assignment_13/features/user/widgets/profile_user_info.dart';
import 'package:assignment_13/features/user/widgets/profile_app_bar.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/features/settings/views/settings_screen.dart';
import 'package:assignment_13/features/user/widgets/profile_persistent_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/profile";
  static const routeName = "profile";

  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  void _onMenuTap() {
    FocusScope.of(context).unfocus();
    context.pushNamed(SettingsScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;

    return ref.watch(userProvider).when(
          data: (data) {
            return SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    ProfileAppBar(
                      isDark: isDark,
                      onMenuTap: _onMenuTap,
                    ),
                    ProfileUserInfo(userData: data),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: ProfilePersistentTabBar(
                        controller: _tabController,
                        isDark: isDark,
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ref.watch(profileTimelineProvider).when(
                          data: (threads) {
                            if (threads.isEmpty) {
                              return const Center(
                                child: Text(
                                  "It's empty! Share your story🧶",
                                  style: TextStyle(
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                              );
                            }
                            return ListView.separated(
                              itemCount: threads.length,
                              itemBuilder: (context, index) {
                                var post = threads[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size12),
                                  child: PostCard(
                                    item: post,
                                    isMine: true,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                thickness: Sizes.size1,
                                color: isDark
                                    ? const Color(ThemeColors.darkGray)
                                    : const Color(
                                        ThemeColors.extraLightGray,
                                      ),
                              ),
                            );
                          },
                          error: (error, stackTrace) => Center(
                            child: Text("$error"),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size18,
                      ),
                      child: Container(
                        color: Colors.amber,
                      ),
                      // child: ListView.builder(
                      //   itemCount: profilesReplies.length,
                      //   itemBuilder: (context, index) {
                      //     return Column(
                      //       children: [
                      //         PostCard(
                      //           item: profilesReplies[index],
                      //           isMine: false,
                      //         ),
                      //         ProfileReplies(
                      //             replyInfo: profilesReplies[index].reply!),
                      //       ],
                      //     );
                      //   },
                      // ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }
}
