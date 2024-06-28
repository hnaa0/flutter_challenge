import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/models/activities.dart';
import 'package:assignment_13/features/activity/widgets/activity_user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityListView extends ConsumerWidget {
  const ActivityListView({
    super.key,
    required this.list,
  });

  final List<Activity> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ActivityUserListTile(
          userInfo: list[index],
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: ref.watch(settingsThemeModeProvider).darkMode
            ? const Color(ThemeColors.darkGray)
            : const Color(
                ThemeColors.extraLightGray,
              ),
      ),
    );
  }
}
