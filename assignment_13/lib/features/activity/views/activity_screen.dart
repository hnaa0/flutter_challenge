import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/models/activities.dart';
import 'package:assignment_13/features/activity/activity_type.dart';
import 'package:assignment_13/features/activity/widgets/activity_list_view.dart';
import 'package:assignment_13/features/activity/widgets/persistent_tab_bar.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  static const routeUrl = "/activity";
  static const routeName = "activity";

  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
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
              ActivityListView(list: activities),
              ActivityListView(list: replies),
              ActivityListView(list: mentions),
              ActivityListView(list: follows),
              ActivityListView(list: likes),
            ],
          ),
        ),
      ),
    );
  }
}
