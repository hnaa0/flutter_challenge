import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/widgets/certification_mark.dart';
import 'package:assignment_13/widgets/post_card_img_slider.dart';
import 'package:assignment_13/widgets/post_card_user_avatar.dart';
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
                PostCardUserAvatar(avatarImg: widget.avatarImg),
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const SizedBox(
                      width: Sizes.size48,
                      height: Sizes.size48,
                    ),
                    if (widget.replyUsersImg.length == 2) ...[
                      Positioned(
                        top: Sizes.size4,
                        left: Sizes.size4,
                        child: CircleAvatar(
                          radius: Sizes.size10,
                          backgroundImage:
                              NetworkImage(widget.replyUsersImg[0]),
                        ),
                      ),
                      Positioned(
                        right: Sizes.size2,
                        child: CircleAvatar(
                          radius: Sizes.size14,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: Sizes.size10,
                            backgroundImage:
                                NetworkImage(widget.replyUsersImg[1]),
                          ),
                        ),
                      ),
                    ] else ...[
                      Positioned(
                        right: 0,
                        child: widget.replyUsersImg.isNotEmpty
                            ? CircleAvatar(
                                radius: Sizes.size12,
                                backgroundImage:
                                    NetworkImage(widget.replyUsersImg[0]),
                              )
                            : const SizedBox(),
                      ),
                      Positioned(
                        top: Sizes.size14,
                        left: 0,
                        child: widget.replyUsersImg.length > 1
                            ? CircleAvatar(
                                radius: Sizes.size10,
                                backgroundImage:
                                    NetworkImage(widget.replyUsersImg[1]),
                              )
                            : const SizedBox(),
                      ),
                      Positioned(
                        left: Sizes.size20,
                        bottom: 0,
                        child: widget.replyUsersImg.length > 2
                            ? CircleAvatar(
                                radius: Sizes.size8,
                                backgroundImage:
                                    NetworkImage(widget.replyUsersImg[2]),
                              )
                            : const SizedBox(),
                      ),
                    ]
                  ],
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
                      const FaIcon(
                        FontAwesomeIcons.ellipsis,
                        size: Sizes.size18,
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
