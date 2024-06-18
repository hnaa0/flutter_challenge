import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';

class PostCardReplyUsers extends StatelessWidget {
  const PostCardReplyUsers({
    super.key,
    required this.replyUsers,
  });

  final List<String> replyUsers;

  @override
  Widget build(BuildContext context) {
    if (replyUsers.isEmpty) {
      return Container();
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: Sizes.size48,
          height: replyUsers.length < 3 ? Sizes.size28 : Sizes.size48,
        ),
        if (replyUsers.length == 1) ...[
          Positioned(
            top: Sizes.size4,
            left: Sizes.size4,
            child: CircleAvatar(
              radius: Sizes.size10,
              backgroundImage: NetworkImage(replyUsers[0]),
            ),
          ),
        ] else if (replyUsers.length == 2) ...[
          Positioned(
            top: Sizes.size4,
            left: Sizes.size4,
            child: CircleAvatar(
              radius: Sizes.size10,
              backgroundImage: NetworkImage(replyUsers[0]),
            ),
          ),
          Positioned(
            right: Sizes.size2,
            child: CircleAvatar(
              radius: Sizes.size14,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: Sizes.size10,
                backgroundImage: NetworkImage(replyUsers[1]),
              ),
            ),
          ),
        ] else ...[
          Positioned(
            right: 0,
            child: replyUsers.isNotEmpty
                ? CircleAvatar(
                    radius: Sizes.size12,
                    backgroundImage: NetworkImage(replyUsers[0]),
                  )
                : const SizedBox(),
          ),
          Positioned(
            top: Sizes.size14,
            left: 0,
            child: replyUsers.length > 1
                ? CircleAvatar(
                    radius: Sizes.size10,
                    backgroundImage: NetworkImage(replyUsers[1]),
                  )
                : const SizedBox(),
          ),
          Positioned(
            left: Sizes.size20,
            bottom: 0,
            child: replyUsers.length > 2
                ? CircleAvatar(
                    radius: Sizes.size8,
                    backgroundImage: NetworkImage(replyUsers[2]),
                  )
                : const SizedBox(),
          ),
        ]
      ],
    );
  }
}
