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
        ActivityType.mention => Colors.green,
        ActivityType.reply => Colors.cyan,
        ActivityType.follow => Colors.purple,
        ActivityType.like => Colors.pink,
      };
}
