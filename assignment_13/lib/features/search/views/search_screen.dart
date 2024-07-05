import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/search/view_models/search_view_model.dart';
import 'package:assignment_13/features/search/widgets/search_user.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/search";
  static const routeName = "search";

  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _text = "";

  void _onSearchChanged(String text) {
    setState(() {
      _text = _textController.text;
    });

    ref.read(searchProvider.notifier).updateUserList(_text);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;

    return ref.watch(searchProvider).when(
          data: (users) {
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
                          isDark: isDark,
                          controller: _textController,
                          focusNode: _focusNode,
                          onSearchChanged: _onSearchChanged,
                        ),
                      ),
                      SliverList.separated(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          var user = users[index];
                          return SearchUser(
                            userInfo: user,
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: isDark
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

class SliverUserSearchTextField extends SliverPersistentHeaderDelegate {
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool isDark;
  final Function onSearchChanged;

  SliverUserSearchTextField({
    required this.focusNode,
    required this.controller,
    required this.isDark,
    required this.onSearchChanged,
  });

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
      color: isDark ? const Color(ThemeColors.black) : Colors.white,
      child: CupertinoSearchTextField(
        onChanged: (value) => onSearchChanged(value),
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
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
