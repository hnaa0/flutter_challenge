import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/home/widgets/certification_mark.dart';
import 'package:assignment_13/features/home/widgets/ellipsis_bottom_sheet.dart';
import 'package:assignment_13/features/home/widgets/post_card_img_slider.dart';
import 'package:assignment_13/features/home/widgets/post_card_reply_users.dart';
import 'package:assignment_13/features/home/widgets/post_card_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.avatarImg,
    required this.userName,
    required this.replyUsersImg,
    required this.replies,
    required this.likes,
    required this.postTime,
    required this.isCertified,
    this.text,
    this.postImg,
  });

  final String avatarImg;
  final String userName;
  final List<String> replyUsersImg;
  final String postTime;
  final String? text;
  final List<String>? postImg;
  final int replies;
  final int likes;
  final bool isCertified;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late PageController _pageController;
  bool _isLiked = false;
  bool _isRetweet = false;

  void _initController() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction:
          widget.postImg != null && widget.postImg!.length > 1 ? 0.9 : 1,
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
      elevation: 0,
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
    return Padding(
      padding: const EdgeInsets.all(
        Sizes.size16,
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
                  avatarImg: widget.avatarImg,
                ),
                Gaps.v10,
                const Expanded(
                  child: VerticalDivider(
                    thickness: Sizes.size2,
                    color: Color(
                      ThemeColors.extraLightGray,
                    ),
                  ),
                ),
                Gaps.v10,
                PostCardReplyUsers(
                  replyUsers: widget.replyUsersImg,
                ),
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
                        widget.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h4,
                      Opacity(
                        opacity: widget.isCertified ? 1 : 0,
                        child: const CertificationMark(),
                      ),
                      const Spacer(),
                      Text(
                        widget.postTime,
                        style: const TextStyle(
                          color: Color(
                            ThemeColors.darkGray,
                          ),
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: () => _onEllipsisTap(context),
                        child: const FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: Sizes.size18,
                        ),
                      ),
                      Gaps.h6,
                    ],
                  ),
                  Gaps.v6,
                  Text(
                    widget.text ?? "",
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v10,
                  if (widget.postImg != null)
                    PostCardImgSlider(
                      postImg: widget.postImg!,
                      controller: _pageController,
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
                            color: _isLiked ? Colors.red : null,
                          ),
                        ),
                        Gaps.h20,
                        const FaIcon(
                          FontAwesomeIcons.comment,
                          size: Sizes.size20 + Sizes.size2,
                        ),
                        Gaps.h20,
                        GestureDetector(
                          onTap: _onRetweetTap,
                          child: FaIcon(
                            FontAwesomeIcons.retweet,
                            size: Sizes.size20 + Sizes.size2,
                            color: _isRetweet ? Colors.green : null,
                          ),
                        ),
                        Gaps.h20,
                        const FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: Sizes.size20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size6,
                    ),
                    child: Text(
                      "${_isRetweet ? widget.replies + 1 : widget.replies} replies · ${_isLiked ? widget.likes + 1 : widget.likes} likes",
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
