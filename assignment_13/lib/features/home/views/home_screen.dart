import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/authentication/repos/authentication_repo.dart';
import 'package:assignment_13/features/home/view_models/home_timeline_view_model.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/common/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(
          milliseconds: 400,
        ),
        curve: Curves.easeInOut);
  }

  Future<void> _onRefresh() {
    return ref.watch(homeTimelineProvider.notifier).refresh();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;

    return ref.watch(homeTimelineProvider).when(
          data: (threads) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size12,
                ),
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  displacement: 50,
                  edgeOffset: 50,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
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
                      threads.isEmpty
                          ? const SliverToBoxAdapter(
                              child: SizedBox(
                                // height:
                                //     MediaQuery.of(context).size.height * 0.8,
                                child: Center(
                                  child: Text(
                                    softWrap: true,
                                    "Create a new thread or follow a friend!",
                                    style: TextStyle(
                                      fontSize: Sizes.size20,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SliverList.separated(
                              itemCount: threads.length < 3
                                  ? threads.length + 2
                                  : threads.length,
                              itemBuilder: (context, index) {
                                if (index > threads.length - 1) {
                                  return Container(
                                    height: 250,
                                  );
                                }

                                var post = threads[index];
                                var isMine = post.creatorUid ==
                                    ref.watch(authRepo).user!.uid;
                                return PostCard(
                                  item: post,
                                  isMine: isMine,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return index > threads.length - 1
                                    ? const SizedBox.shrink()
                                    : Divider(
                                        thickness: Sizes.size1,
                                        color: isDark
                                            ? const Color(ThemeColors.darkGray)
                                            : const Color(
                                                ThemeColors.extraLightGray,
                                              ),
                                      );
                              },
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
