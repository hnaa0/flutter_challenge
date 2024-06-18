import 'package:assignment_13/models/posts.dart';

final profilesThreads = [
  Post(
    userName: "gnar",
    avatarImg: "assets/images/avatar.jpg",
    isCertified: false,
    postTime: "1h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text:
        "Give @cheeez_ a follow if you want to see more orange tabby or ginger cat content!",
  ),
  Post(
    userName: "gnar",
    avatarImg: "assets/images/avatar.jpg",
    isCertified: false,
    postTime: "1h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text: "happy sunday🎈",
    postImg: [
      "https://images.pexels.com/photos/1198507/pexels-photo-1198507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
  ),
  Post(
    userName: "gnar",
    avatarImg: "assets/images/avatar.jpg",
    isCertified: false,
    postTime: "1h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text: "AGREE",
    quote: {
      "account": "ruble.cat",
      "avatarImg":
          "https://images.pexels.com/photos/236606/pexels-photo-236606.jpeg?auto=compress&cs=tinysrgb&w=600",
      "text": "All CATS ARE CUTE",
      "postImg":
          "https://images.pexels.com/photos/140134/pexels-photo-140134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "replies": 74,
    },
  ),
];

final profilesReplies = [
  Post(
    userName: "yummychubby",
    avatarImg:
        "https://images.pexels.com/photos/616838/pexels-photo-616838.jpeg?auto=compress&cs=tinysrgb&w=600",
    isCertified: false,
    postTime: "5h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text: "ALL TREATS",
    quote: {
      "account": "aboutmeow",
      "avatarImg":
          "https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "text": "What is your favorite flavored treat?",
      "postImg":
          "https://images.pexels.com/photos/3318215/pexels-photo-3318215.jpeg?auto=compress&cs=tinysrgb&w=600",
      "replies": 256,
    },
    reply: {
      "account": "gnar",
      "avatarImg": "assets/images/avatar.jpg",
      "time": "5h",
      "text": "Definetely!!!😻🥩🍖🍤",
    },
  )
];
