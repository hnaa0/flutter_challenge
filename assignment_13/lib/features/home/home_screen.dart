import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/models/posts.dart';
import 'package:assignment_13/common/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(
          milliseconds: 400,
        ),
        curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                title: GestureDetector(
                  onTap: _scrollToTop,
                  child: const FaIcon(
                    FontAwesomeIcons.threads,
                    size: Sizes.size40,
                  ),
                ),
                centerTitle: true,
              ),
              SliverList.separated(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  var post = posts[index];
                  return PostCard(
                    item: post,
                    isMine: false,
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: Sizes.size1,
                  color: Color(
                    ThemeColors.extraLightGray,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
