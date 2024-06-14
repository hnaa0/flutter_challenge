import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/search/users.dart';
import 'package:assignment_13/features/search/widgets/search_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              title: Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.size32,
                ),
              ),
              centerTitle: false,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverUserSearchTextField(),
            ),
            SliverList.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return SearchUser(
                  avatar: user.profileImg,
                  account: user.userAccount,
                  name: user.userName,
                  follower: user.followerCount,
                  isCertified: user.isCertified,
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
    );
  }
}

class SliverUserSearchTextField extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size4,
        vertical: Sizes.size10,
      ),
      color: Colors.white,
      child: const CupertinoSearchTextField(),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
