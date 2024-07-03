import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';

class PostCardReplyUsers extends StatelessWidget {
  const PostCardReplyUsers({
    super.key,
    required this.replies,
  });

  final List<Map<String, dynamic>> replies;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: Sizes.size48,
          height: replies.length < 3 ? Sizes.size28 : Sizes.size48,
        ),
        if (replies.length == 1) ...[
          const Positioned(
            top: Sizes.size4,
            left: Sizes.size4,
            child: CircleAvatar(
              radius: Sizes.size10,
              // backgroundImage: NetworkImage(replies[0].),
            ),
          ),
        ] else if (replies.length == 2) ...[
          const Positioned(
            top: Sizes.size4,
            left: Sizes.size4,
            child: CircleAvatar(
              radius: Sizes.size10,
              // backgroundImage: NetworkImage(replyUsers[0]),
            ),
          ),
          const Positioned(
            right: Sizes.size2,
            child: CircleAvatar(
              radius: Sizes.size14,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: Sizes.size10,
                // backgroundImage: NetworkImage(replyUsers[1]),
              ),
            ),
          ),
        ] else ...[
          const Positioned(
            right: 0,
            child: CircleAvatar(
              radius: Sizes.size12,
              // backgroundImage: NetworkImage(replyUsers[0]),
            ),
          ),
          Positioned(
            top: Sizes.size14,
            left: 0,
            child: replies.length > 1
                ? const CircleAvatar(
                    radius: Sizes.size10,
                    // backgroundImage: NetworkImage(replyUsers[1]),
                  )
                : const SizedBox(),
          ),
          Positioned(
            left: Sizes.size20,
            bottom: 0,
            child: replies.length > 2
                ? const CircleAvatar(
                    radius: Sizes.size8,
                    // backgroundImage: NetworkImage(replyUsers[2]),
                  )
                : const SizedBox(),
          ),
        ]
      ],
    );
  }
}
