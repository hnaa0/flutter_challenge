import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ActivityType {
  mention,
  reply,
  follow,
  like;

  IconData get iconData => switch (this) {
        ActivityType.mention => FontAwesomeIcons.threads,
        ActivityType.reply => FontAwesomeIcons.reply,
        ActivityType.follow => FontAwesomeIcons.solidUser,
        ActivityType.like => FontAwesomeIcons.solidHeart,
      };

  Color get color => switch (this) {
        ActivityType.mention => Colors.green.shade400,
        ActivityType.reply => Colors.blue.shade300,
        ActivityType.follow => Colors.deepPurple,
        ActivityType.like => Colors.pink,
      };
}
