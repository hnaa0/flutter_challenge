import 'package:assignment_13/features/activity/activity_type.dart';

class Activity {
  Activity({
    required this.account,
    required this.profileImg,
    required this.type,
    required this.time,
    required this.text,
    required this.post,
  });

  final String account;
  final String profileImg;
  final ActivityType type;
  final String time;
  final String text;
  final String post;
}

final activities = [
  Activity(
    account: "cheeez_",
    profileImg:
        "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    type: ActivityType.mention,
    time: "4h",
    text: "Here's a thread you should follow if you love cat @gnar",
    post: "hello",
  ),
  Activity(
    account: "cheeez_",
    profileImg:
        "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    type: ActivityType.reply,
    time: "4h",
    text: "Count me in!",
    post: "Starting out my gardening club with threads❤",
  ),
  Activity(
    account: "ruble.cat",
    profileImg:
        "https://images.pexels.com/photos/236606/pexels-photo-236606.jpeg?auto=compress&cs=tinysrgb&w=600",
    type: ActivityType.like,
    time: "5h",
    text: "",
    post: "✨🎇🎆",
  ),
  Activity(
    account: "ruble.cat",
    profileImg:
        "https://images.pexels.com/photos/236606/pexels-photo-236606.jpeg?auto=compress&cs=tinysrgb&w=600",
    type: ActivityType.like,
    time: "5h",
    text: "",
    post: "happy sunday🎈",
  ),
  Activity(
    account: "do_odle",
    profileImg:
        "https://images.pexels.com/photos/3397939/pexels-photo-3397939.jpeg?auto=compress&cs=tinysrgb&w=600",
    type: ActivityType.follow,
    time: "5h",
    text: "",
    post: "hello",
  ),
];
