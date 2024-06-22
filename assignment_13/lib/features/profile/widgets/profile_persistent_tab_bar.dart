import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';

class ProfilePersistentTabBar extends SliverPersistentHeaderDelegate {
  ProfilePersistentTabBar({
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color:
          isDarkMode(context) ? const Color(ThemeColors.black) : Colors.white,
      child: TabBar(
        controller: controller,
        indicatorWeight: 1.2,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 46.0;

  @override
  double get minExtent => 46.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
