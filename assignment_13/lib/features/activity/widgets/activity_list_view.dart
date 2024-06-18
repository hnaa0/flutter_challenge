import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/models/activities.dart';
import 'package:assignment_13/features/activity/widgets/activity_user_list_tile.dart';
import 'package:flutter/material.dart';

class ActivityListView extends StatelessWidget {
  const ActivityListView({
    super.key,
    required this.list,
  });

  final List<Activity> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ActivityUserListTile(
          userInfo: list[index],
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Color(
          ThemeColors.extraLightGray,
        ),
      ),
    );
  }
}
