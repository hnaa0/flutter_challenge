import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/search/users.dart';
import 'package:assignment_13/features/search/widgets/search_user.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        child: GestureDetector(
          onTap: () {
            _focusNode.unfocus();
          },
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
                delegate: SliverUserSearchTextField(
                  controller: _controller,
                  focusNode: _focusNode,
                ),
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
                separatorBuilder: (context, index) => Divider(
                  color: isDarkMode(context)
                      ? const Color(ThemeColors.darkGray)
                      : const Color(
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

class SliverUserSearchTextField extends SliverPersistentHeaderDelegate {
  final FocusNode focusNode;
  final TextEditingController controller;

  SliverUserSearchTextField(
      {required this.focusNode, required this.controller});

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
      color:
          isDarkMode(context) ? const Color(ThemeColors.black) : Colors.white,
      child: CupertinoSearchTextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        style:
            TextStyle(color: isDarkMode(context) ? Colors.white : Colors.black),
      ),
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
