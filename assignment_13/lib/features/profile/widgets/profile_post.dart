import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/home/posts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePost extends StatelessWidget {
  const ProfilePost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Gaps.v6,
              Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(ThemeColors.lightGray),
                ),
                child: const CircleAvatar(
                  foregroundImage: AssetImage("assets/images/avatar.jpg"),
                ),
              ),
            ],
          ),
          Gaps.h12,
          Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "gnar",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "1h",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Color(
                          ThemeColors.lightGray,
                        ),
                      ),
                    ),
                    Gaps.h14,
                    FaIcon(
                      FontAwesomeIcons.ellipsis,
                      size: Sizes.size18,
                    ),
                  ],
                ),
                Gaps.v4,
                if (post.text != "")
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      post.text!,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                Gaps.v10,
                if (post.postImg != null)
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size14,
                      ),
                    ),
                    child: Image(
                      image: NetworkImage(post.postImg![0]),
                    ),
                  ),
                if (post.quote != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
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
                              foregroundImage:
                                  NetworkImage(post.quote!["avatarImg"]!),
                            ),
                            Gaps.h10,
                            Text(
                              post.quote!["account"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v6,
                        if (post.quote!["text"] != null)
                          Text(
                            post.quote!["text"]!,
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                            ),
                          ),
                        if (post.quote!["postImg"] != null) ...[
                          Gaps.v10,
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Sizes.size14,
                              ),
                            ),
                            child: Image(
                              image: NetworkImage(post.quote!["postImg"]!),
                            ),
                          ),
                        ]
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
                        onTap: () {},
                        child: const FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20 + Sizes.size2,
                        ),
                      ),
                      Gaps.h20,
                      const FaIcon(
                        FontAwesomeIcons.comment,
                        size: Sizes.size20 + Sizes.size2,
                      ),
                      Gaps.h20,
                      GestureDetector(
                        onTap: () {},
                        child: const FaIcon(
                          FontAwesomeIcons.retweet,
                          size: Sizes.size20 + Sizes.size2,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
