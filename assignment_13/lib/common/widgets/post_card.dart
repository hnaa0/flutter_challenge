import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/common/widgets/certification_mark.dart';
import 'package:assignment_13/features/home/widgets/ellipsis_bottom_sheet.dart';
import 'package:assignment_13/common/widgets/post_card_img_slider.dart';
import 'package:assignment_13/features/home/widgets/post_card_reply_users.dart';
import 'package:assignment_13/common/widgets/post_card_user_avatar.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PostCard extends ConsumerStatefulWidget {
  const PostCard({
    super.key,
    required this.item,
    required this.isMine,
  });

  final Post item;
  final bool isMine;

  @override
  ConsumerState<PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard> {
  late PageController _pageController;
  bool _isLiked = false;
  bool _isRetweet = false;

  void _initController() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction:
          widget.item.postImg != null && widget.item.postImg!.length > 1
              ? 0.9
              : 1,
    );
  }

  void _onLikeTap() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _onRetweetTap() {
    setState(() {
      _isRetweet = !_isRetweet;
    });
  }

  void _onEllipsisTap(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const EllipsisBottomSheet(),
      showDragHandle: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size12,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                PostCardUserAvatar(
                  avatarImg: widget.item.avatarImg,
                  isMine: widget.isMine,
                ),
                Gaps.v10,
                if (!widget.isMine) ...[
                  Expanded(
                    child: VerticalDivider(
                      thickness: Sizes.size2,
                      color: isDark
                          ? const Color(ThemeColors.darkGray)
                          : const Color(
                              ThemeColors.extraLightGray,
                            ),
                    ),
                  ),
                  if (widget.item.replyUsersImg.isNotEmpty) ...[
                    Gaps.v10,
                    PostCardReplyUsers(
                      replyUsers: widget.item.replyUsersImg,
                    ),
                  ]
                ]
              ],
            ),
            Gaps.h18,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.item.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h4,
                      Opacity(
                        opacity: widget.item.isCertified ? 1 : 0,
                        child: const CertificationMark(),
                      ),
                      const Spacer(),
                      Text(
                        widget.item.postTime,
                        style: const TextStyle(
                          color: Color(
                            ThemeColors.darkGray,
                          ),
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: widget.isMine
                            ? () {}
                            : () => _onEllipsisTap(context),
                        child: FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: Sizes.size18,
                          color: isDark
                              ? const Color(ThemeColors.lightGray)
                              : Colors.black,
                        ),
                      ),
                      Gaps.h6,
                    ],
                  ),
                  Gaps.v6,
                  Text(
                    widget.item.text ?? "",
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v10,
                  if (widget.item.postImg != null)
                    PostCardImgSlider(
                      postImg: widget.item.postImg!,
                      controller: _pageController,
                    ),
                  if (widget.item.quote != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size18,
                        vertical: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(
                            ThemeColors.lightGray,
                          ).withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(
                          Sizes.size14,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: Sizes.size12,
                                foregroundImage: NetworkImage(
                                    widget.item.quote!["avatarImg"]!),
                              ),
                              Gaps.h10,
                              Text(
                                widget.item.quote!["account"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                            ],
                          ),
                          Gaps.v6,
                          if (widget.item.quote!["text"] != null)
                            Text(
                              widget.item.quote!["text"]!,
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          if (widget.item.quote!["postImg"] != null) ...[
                            Gaps.v10,
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size14,
                                ),
                              ),
                              child: AspectRatio(
                                aspectRatio: 3 / 2,
                                child: Image(
                                  image: NetworkImage(
                                      widget.item.quote!["postImg"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gaps.v10,
                          ],
                          Text(
                            "${widget.item.quote!["replies"]!} replies",
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                              color: Color(
                                ThemeColors.lightGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: _onLikeTap,
                          child: FaIcon(
                            _isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            size: Sizes.size20 + Sizes.size2,
                            color: _isLiked
                                ? Colors.red
                                : isDark
                                    ? const Color(ThemeColors.lightGray)
                                    : null,
                          ),
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          size: Sizes.size20 + Sizes.size2,
                          color: isDark
                              ? const Color(ThemeColors.lightGray)
                              : null,
                        ),
                        Gaps.h20,
                        GestureDetector(
                          onTap: _onRetweetTap,
                          child: FaIcon(
                            FontAwesomeIcons.retweet,
                            size: Sizes.size20 + Sizes.size2,
                            color: _isRetweet
                                ? Colors.green
                                : isDark
                                    ? const Color(ThemeColors.lightGray)
                                    : null,
                          ),
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: Sizes.size20,
                          color: isDark
                              ? const Color(ThemeColors.lightGray)
                              : null,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size6,
                    ),
                    child: Text(
                      "${NumberFormat.compact().format(_isRetweet ? widget.item.replies + 1 : widget.item.replies)} replies · ${NumberFormat.compact().format(_isLiked ? widget.item.likes + 1 : widget.item.likes)} likes",
                      style: const TextStyle(
                        color: Color(
                          ThemeColors.darkGray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
