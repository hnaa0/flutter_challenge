import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.avatarImg,
    required this.userName,
    required this.likeUsersImg,
    required this.replies,
    required this.likes,
    required this.postTime,
    required this.isCertified,
    this.text,
    this.postImg,
  });

  final String avatarImg;
  final String userName;
  final List<String> likeUsersImg;
  final String postTime;
  final String? text;
  final String? postImg;
  final int replies;
  final int likes;
  final bool isCertified;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;
  bool _isRetweet = false;

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.avatarImg,
                    ),
                    radius: Sizes.size24,
                  ),
                  Positioned(
                    bottom: -Sizes.size2,
                    right: -Sizes.size4,
                    child: Container(
                      alignment: Alignment.center,
                      width: Sizes.size24,
                      height: Sizes.size24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(width: Sizes.size2, color: Colors.white),
                        color: const Color(ThemeColors.black),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.plus,
                        size: Sizes.size10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const SizedBox(
                    width: Sizes.size48,
                    height: Sizes.size48,
                  ),
                  if (widget.likeUsersImg.length == 2) ...[
                    Positioned(
                      top: Sizes.size4,
                      left: Sizes.size4,
                      child: CircleAvatar(
                        radius: Sizes.size10,
                        backgroundImage: NetworkImage(widget.likeUsersImg[0]),
                      ),
                    ),
                    Positioned(
                      right: Sizes.size2,
                      child: CircleAvatar(
                        radius: Sizes.size14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: Sizes.size10,
                          backgroundImage: NetworkImage(widget.likeUsersImg[1]),
                        ),
                      ),
                    ),
                  ] else ...[
                    Positioned(
                      right: 0,
                      child: widget.likeUsersImg.isNotEmpty
                          ? CircleAvatar(
                              radius: Sizes.size12,
                              backgroundImage:
                                  NetworkImage(widget.likeUsersImg[0]),
                            )
                          : const SizedBox(),
                    ),
                    Positioned(
                      top: Sizes.size14,
                      left: 0,
                      child: widget.likeUsersImg.length > 1
                          ? CircleAvatar(
                              radius: Sizes.size10,
                              backgroundImage:
                                  NetworkImage(widget.likeUsersImg[1]),
                            )
                          : const SizedBox(),
                    ),
                    Positioned(
                      left: Sizes.size20,
                      bottom: 0,
                      child: widget.likeUsersImg.length > 2
                          ? CircleAvatar(
                              radius: Sizes.size8,
                              backgroundImage:
                                  NetworkImage(widget.likeUsersImg[2]),
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
                      child: Container(
                        alignment: Alignment.center,
                        width: Sizes.size14,
                        height: Sizes.size14,
                        decoration: BoxDecoration(
                          color: const Color(
                            ThemeColors.twitterBlue,
                          ),
                          borderRadius: BorderRadius.circular(
                            Sizes.size20,
                          ),
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.check,
                          size: Sizes.size8,
                          color: Colors.white,
                        ),
                      ),
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
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size18,
                    ),
                  ),
                  child: widget.postImg != null
                      ? AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Image(
                            image: NetworkImage(
                              widget.postImg!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
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
    );
  }
}
