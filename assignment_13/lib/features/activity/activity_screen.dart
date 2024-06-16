import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/activity/activities.dart';
import 'package:assignment_13/features/activity/activity_type.dart';
import 'package:assignment_13/features/activity/widgets/activity_user_list_tile.dart';
import 'package:assignment_13/features/activity/widgets/persistent_tab_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 5,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> activitiesTab = [
      "All",
      "Replies",
      "Mentions",
      "Follows",
      "Likes",
    ];

    final replies = activities
        .where((element) => element.type == ActivityType.reply)
        .toList();
    final mentions = activities
        .where((element) => element.type == ActivityType.mention)
        .toList();
    final follows = activities
        .where((element) => element.type == ActivityType.follow)
        .toList();
    final likes = activities
        .where((element) => element.type == ActivityType.like)
        .toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                title: Text(
                  "Activity",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Sizes.size32,
                  ),
                ),
                centerTitle: false,
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabBar(
                  controller: _tabController,
                  tabs: activitiesTab,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              ListView.separated(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ActivityUserListTile(
                    userInfo: activities[index],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              ),
              ListView.separated(
                itemCount: replies.length,
                itemBuilder: (context, index) {
                  return ActivityUserListTile(
                    userInfo: replies[index],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              ),
              ListView.separated(
                itemCount: mentions.length,
                itemBuilder: (context, index) {
                  return ActivityUserListTile(
                    userInfo: mentions[index],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              ),
              ListView.separated(
                itemCount: follows.length,
                itemBuilder: (context, index) {
                  return ActivityUserListTile(
                    userInfo: follows[index],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              ),
              ListView.separated(
                itemCount: likes.length,
                itemBuilder: (context, index) {
                  return ActivityUserListTile(
                    userInfo: likes[index],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
