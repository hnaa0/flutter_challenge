import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/activity/widgets/activity_tab.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  PersistentTabBar({
    required this.controller,
    required this.tabs,
  });

  final TabController controller;
  final List<String> tabs;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size4,
      ),
      color:
          isDarkMode(context) ? const Color(ThemeColors.black) : Colors.white,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        dividerHeight: 0,
        labelPadding: const EdgeInsets.symmetric(horizontal: Sizes.size4),
        indicatorColor: Colors.transparent,
        tabs: [
          for (int i = 0; i < tabs.length; i++)
            Tab(
              child: ActivityTab(
                text: tabs[i],
                isSelected: controller.index == i,
              ),
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 48.0;

  @override
  double get minExtent => 48.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
