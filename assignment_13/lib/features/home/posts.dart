class Post {
  Post({
    required this.userName,
    required this.avatarImg,
    required this.isCertified,
    required this.postTime,
    required this.likes,
    required this.replies,
    required this.replyUsersImg,
    this.quote,
    this.postImg,
    this.text,
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
  final Map<String, String>? quote;
}

final posts = [
  Post(
    userName: "pubity",
    avatarImg:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWmnioGbd44aQvqZ5bYmfiuIgn3QfPIvidTg&s",
    isCertified: true,
    postTime: "2m",
    likes: 391,
    replies: 36,
    replyUsersImg: [
      "https://images.pexels.com/photos/19254459/pexels-photo-19254459.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/20697751/pexels-photo-20697751.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    ],
    text:
        "Good morning Thriends ☀️ Let’s share some pictures and fun facts about our pets below 😍",
    postImg: [
      "https://images.pexels.com/photos/20613883/pexels-photo-20613883.jpeg?auto=compress&cs=tinysrgb&w=400",
    ],
  ),
  // Post(
  //   userName: "selenagomez",
  //   avatarImg:
  //       "https://scontent.cdninstagram.com/v/t51.2885-19/368086617_547068480861202_4257620770302587062_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=110&_nc_ohc=WYLwigwXd1sQ7kNvgGLWeTI&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYCxIsFhnse5gye1kmVCOfMiYBTWgihRYS-9asDIeqAdWw&oe=666DC44D&_nc_sid=10d13b",
  //   isCertified: true,
  //   postTime: "3m",
  //   likes: 80000,
  //   replies: 21685,
  //   replyUsersImg: [
  //     "https://images.pexels.com/photos/25384540/pexels-photo-25384540.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
  //     "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
  //     "https://images.pexels.com/photos/25713558/pexels-photo-25713558.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
  //   ],
  //   text:
  //       "Y’all have been asking for new music for a while. Since I’m not quite done with SG3, I wanted to put out a fun little song I wrote a while back that’s perfect for the end of summer. SINGLE SOON. August 25th. Presave it now. 😘",
  //   postImg: [
  //     "https://scontent.cdninstagram.com/v/t51.29350-15/368454397_622190843103048_2213562557136672654_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=100&_nc_ohc=bFtjKViKhqwQ7kNvgEno4GQ&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE3MTQ0MTM0NTIyNTg5ODA5Mg%3D%3D.2-ccb7-5&oh=00_AYCTZQ7zWTC-jlNIbpe23Eb8k49Wvk2mxByRkHPY2zX56w&oe=666DD5A2&_nc_sid=10d13b",
  //     "https://scontent.cdninstagram.com/v/t51.29350-15/367998090_2515935295236746_7733992586787933195_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDEwODAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=102&_nc_ohc=AUYwpwfeUoYQ7kNvgG0oIXD&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE3MTQ0MTM0NTIzNDI2NDUxNw%3D%3D.2-ccb7-5&oh=00_AYD9GB4VOpIZfObbL4VWSUEzPpo0ezqYiHgejaygHYdHVQ&oe=666DDAAB&_nc_sid=10d13b",
  //   ],
  // ),
  Post(
    userName: "doodledogsclub",
    avatarImg:
        "https://images.pexels.com/photos/25713558/pexels-photo-25713558.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    isCertified: true,
    postTime: "5m",
    likes: 451,
    replies: 154,
    replyUsersImg: [
      "https://images.pexels.com/photos/19254459/pexels-photo-19254459.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/20697751/pexels-photo-20697751.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"
    ],
    text: "Barbie or Oppenheimer? 🏩💣",
    postImg: [
      "https://media-be.chewy.com/wp-content/uploads/2022/08/12164017/barbiecore-dog-pink-couch-1024x615.jpg",
      "https://i.pinimg.com/236x/4c/ba/48/4cba488194e837de15215644330ca8c8.jpg",
    ],
  ),
  Post(
    userName: "tropicalseductions",
    avatarImg:
        "https://images.pexels.com/photos/25810556/pexels-photo-25810556.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    isCertified: false,
    postTime: "17m",
    likes: 4,
    replies: 2,
    replyUsersImg: [
      "https://images.pexels.com/photos/25713558/pexels-photo-25713558.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/17468804/pexels-photo-17468804.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    ],
    text: "Drop a comment here to test things out.",
  ),
  Post(
      userName: "nala_cat",
      avatarImg:
          "https://scontent.cdninstagram.com/v/t51.2885-19/358017564_619125516679487_2823203487940479365_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=F3oGGNgbIdMQ7kNvgE4CsFg&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYC2s_UXDIpG2u4mLui-AXyc0b6IXDs8Jw2Uwt0hvin_3A&oe=66732D5B&_nc_sid=10d13b",
      isCertified: true,
      postTime: "38m",
      likes: 631,
      replies: 64,
      replyUsersImg: [
        "https://images.pexels.com/photos/25810556/pexels-photo-25810556.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
        "https://images.pexels.com/photos/25748587/pexels-photo-25748587.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
        "https://images.pexels.com/photos/25384540/pexels-photo-25384540.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      ],
      text:
          "I had to say goodbye to my sister Stella earlier this week. I miss you so much Stella Bella. Rest in paradise my sister ❤️🌈",
      postImg: [
        "https://scontent.cdninstagram.com/v/t51.29350-15/375884146_1463558161135763_2484874533823325265_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMTcweDEzNjkuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=PoK99YB5QfkQ7kNvgFja141&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE4NjkyNjU5ODgzMzk4MTg3Mg%3D%3D.2-ccb7-5&oh=00_AYDQuN_Cqsf1dFj6vIUz_gDVwqNcFP-lAvpVHz9p_BMsIg&oe=66713BEF&_nc_sid=10d13b",
      ]),
  Post(
    userName: "_plantswithkrystal_",
    avatarImg:
        "https://scontent.cdninstagram.com/v/t51.2885-19/343564605_626154996028024_3429561118814250608_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=pRkiuu2fztMQ7kNvgGNEz50&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYAzil5ZMlGJoFlwsO-2mMNGWDRtZdqyclrGluwdDY0u-g&oe=66733481&_nc_sid=10d13b",
    isCertified: true,
    postTime: "1h",
    likes: 74,
    replies: 8,
    replyUsersImg: [
      "https://images.pexels.com/photos/25380746/pexels-photo-25380746/free-photo-of-iluminacion-creativa-con-fotex.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/25372314/pexels-photo-25372314.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/25328919/pexels-photo-25328919.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    ],
    text:
        "If you're reading this, go water that thirsty plant. You're welcome ☺",
  ),
  Post(
    userName: "terracottacoco",
    avatarImg:
        "https://scontent.cdninstagram.com/v/t51.2885-19/241723143_267876151820815_7763756124386005590_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=KnuyK5kKi1sQ7kNvgHSTFva&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYBNcOcRhwYJ0lbCVjI50YZZqgf8rhQAEjIn9dg9MT9Q9A&oe=66733BB6&_nc_sid=10d13b",
    isCertified: true,
    postTime: "1h",
    likes: 158,
    replies: 42,
    replyUsersImg: [
      "https://images.pexels.com/photos/25313428/pexels-photo-25313428.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/25315803/pexels-photo-25315803.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/18836829/pexels-photo-18836829.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    ],
    postImg: [
      "https://pleated-jeans.com/wp-content/uploads/2023/06/gardening-humour-memes-23.jpg"
    ],
  ),
  Post(
    userName: "tuckerbudzyn",
    avatarImg:
        "https://scontent.cdninstagram.com/v/t51.2885-19/357811053_1735941866864717_4969013561182587066_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=105&_nc_ohc=FvAyGj3bYJ8Q7kNvgG_G5Bp&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYC1D_ruZJzHa3Cwygws4sMlpX11n0DSNT7GadyMQF_WkA&oe=66731445&_nc_sid=10d13b",
    isCertified: true,
    postTime: "2h",
    likes: 8410,
    replies: 239,
    replyUsersImg: [
      "https://images.pexels.com/photos/25810556/pexels-photo-25810556.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/25810556/pexels-photo-25810556.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
      "https://images.pexels.com/photos/25372314/pexels-photo-25372314.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
    ],
    text: "Please boop before you proceed your scroll",
    postImg: [
      "https://scontent.cdninstagram.com/v/t51.29350-15/421030496_448637841057198_1295652494835693548_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMTIxeDE1NzYuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=106&_nc_ohc=BSDfrEkJexEQ7kNvgEGLTwy&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzMzMDk4MjIzMTE4MjY1MzIxOA%3D%3D.2-ccb7-5&oh=00_AYDV2YVDCqsGRC_rPUzyO4QRTF2XXp1ZdPKMLhWpm5N8pg&oe=66712095&_nc_sid=10d13b",
    ],
  ),
  Post(
    userName: "gnar",
    avatarImg:
        "https://images.pexels.com/photos/681118/pexels-photo-681118.jpeg?auto=compress&cs=tinysrgb&w=600",
    isCertified: false,
    postTime: "2h",
    likes: 3,
    replies: 0,
    replyUsersImg: [],
    text: "SEND ME HOME",
  ),
];
