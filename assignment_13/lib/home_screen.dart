import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: Sizes.size40,
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PostCard(
                isCertified: true,
                avatarImg:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWmnioGbd44aQvqZ5bYmfiuIgn3QfPIvidTg&s",
                userName: "pubity",
                postTime: "2m",
                postImg: [
                  "https://scontent.cdninstagram.com/v/t51.29350-15/447310197_990965042244403_5405111307856853142_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjkweDEyNzkuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=9RDTepMlW48Q7kNvgFwFBDP&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzM4MDg4NjQ0MTQyMzkwMTc1NQ%3D%3D.2-ccb7-5&oh=00_AYCdgJWQhF9OCpSUxJfqiqRWFLoQVoY6fsQDbZAkx0UpZA&oe=666A7D59&_nc_sid=10d13b",
                  "https://scontent.cdninstagram.com/v/t51.29350-15/447310197_990965042244403_5405111307856853142_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjkweDEyNzkuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=9RDTepMlW48Q7kNvgFwFBDP&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzM4MDg4NjQ0MTQyMzkwMTc1NQ%3D%3D.2-ccb7-5&oh=00_AYCdgJWQhF9OCpSUxJfqiqRWFLoQVoY6fsQDbZAkx0UpZA&oe=666A7D59&_nc_sid=10d13b"
                ],
                text:
                    "Good morning Thriends ☀️ Let’s share some pictures and fun facts about our pets below 😍",
                likes: 391,
                replies: 36,
                replyUsersImg: [
                  "https://images.pexels.com/photos/19254459/pexels-photo-19254459.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/20697751/pexels-photo-20697751.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"
                ],
              ),
              PostCard(
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/368086617_547068480861202_4257620770302587062_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=110&_nc_ohc=WYLwigwXd1sQ7kNvgGLWeTI&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYCxIsFhnse5gye1kmVCOfMiYBTWgihRYS-9asDIeqAdWw&oe=666DC44D&_nc_sid=10d13b",
                userName: "selenagomez",
                text:
                    "Y’all have been asking for new music for a while. Since I’m not quite done with SG3, I wanted to put out a fun little song I wrote a while back that’s perfect for the end of summer. SINGLE SOON. August 25th. Presave it now. 😘",
                postImg: [
                  "https://scontent.cdninstagram.com/v/t51.29350-15/368454397_622190843103048_2213562557136672654_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=100&_nc_ohc=ZhZTNjx_SH8Q7kNvgGuKm65&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE3MTQ0MTM0NTIyNTg5ODA5Mg%3D%3D.2-ccb7-5&oh=00_AYA9RA_zaiNNjn39y-YuIGmh1meg4Uq0iUFdUkMJZezFOA&oe=666DD5A2&_nc_sid=10d13b",
                  "https://scontent.cdninstagram.com/v/t51.29350-15/367998090_2515935295236746_7733992586787933195_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDEwODAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=102&_nc_ohc=AUYwpwfeUoYQ7kNvgEg1ZRF&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE3MTQ0MTM0NTIzNDI2NDUxNw%3D%3D.2-ccb7-5&oh=00_AYA8ez0dWmw8n8Nu_GSCce2gq_iPvroJYrbYvV3UjUw-Ig&oe=666DA26B&_nc_sid=10d13b",
                ],
                replyUsersImg: [
                  "https://images.pexels.com/photos/25384540/pexels-photo-25384540.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25713558/pexels-photo-25713558.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 21577,
                likes: 80000,
                postTime: "3m",
                isCertified: true,
              ),
              PostCard(
                isCertified: false,
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/358000832_1326230164673992_9136630141483537456_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=104&_nc_ohc=sOPFvml5yZgQ7kNvgFLum3w&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYBtEZ62zCMBiyw4KR6trLFwa5bhKqJmj1aYDShZwGgvJA&oe=666DBAAA&_nc_sid=10d13b",
                userName: "doodledogsclub",
                text: "Barbie or Oppenheimer? 🏩💣",
                postTime: "5m",
                postImg: [
                  "https://scontent.cdninstagram.com/v/t51.29350-15/361927032_219565837720084_2057763865247157443_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=104&_nc_ohc=B-DAt_pQrCcQ7kNvgEyZE3C&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE1MjYyMjg0OTE1NDYxMzY2Ng%3D%3D.2-ccb7-5&oh=00_AYAalPpBIcineuAP_eHlS8zO-NduJz-cqiWnp5CzJ_HcWw&oe=666DA4E4&_nc_sid=10d13b",
                  "https://scontent.cdninstagram.com/v/t51.29350-15/361953501_1071425513830352_1289584875157414045_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=108&_nc_ohc=XiLFH0k_-48Q7kNvgHBXbpX&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE1MjYyMjg0OTA0NTc5Nzg0OQ%3D%3D.2-ccb7-5&oh=00_AYDktSR7gJg8Qr-4i5IILLVA81Nr56ejH5ehb_ZJVrOWEA&oe=666DB9E9&_nc_sid=10d13b",
                ],
                likes: 45,
                replies: 125,
                replyUsersImg: [
                  "https://images.pexels.com/photos/19254459/pexels-photo-19254459.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/20697751/pexels-photo-20697751.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"
                ],
              ),
              PostCard(
                isCertified: true,
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/358022736_309497898183761_4389722831439468003_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=105&_nc_ohc=je6Y78Zl3_gQ7kNvgGkayFI&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYBiQ69lS3jzpa4O5By3DRdZG97Wlhs9YdTUwCzFrVtESA&oe=666CA152&_nc_sid=10d13b",
                userName: "tropicalseductions",
                text: "Drop a comment here to test things out.",
                replyUsersImg: [
                  "https://images.pexels.com/photos/25713558/pexels-photo-25713558.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/17468804/pexels-photo-17468804.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 2,
                likes: 4,
                postTime: "17m",
              ),
              PostCard(
                isCertified: true,
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/358017564_619125516679487_2823203487940479365_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=bSHscrTl8ukQ7kNvgHzUVfK&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYAlOL1gEvWrlCS04UDhVwYTGIebqR3bP5BGeyyMRHW2OQ&oe=666DAF1B&_nc_sid=10d13b",
                userName: "nala_cat",
                text:
                    "I had to say goodbye to my sister Stella earlier this week. I miss you so much Stella Bella. Rest in paradise my sister ❤️🌈",
                postImg: [
                  "https://scontent.cdninstagram.com/v/t51.29350-15/375884146_1463558161135763_2484874533823325265_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMTcweDEzNjkuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=pvYUGpsxX9EQ7kNvgEMnkdo&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE4NjkyNjU5ODgzMzk4MTg3Mg%3D%3D.2-ccb7-5&oh=00_AYDpu5h482Uyr5SHpTU7yRq8tSd2qmvKQqidMFzEpLXn8A&oe=666BBDAF&_nc_sid=10d13b",
                ],
                replyUsersImg: [
                  "https://images.pexels.com/photos/25810556/pexels-photo-25810556.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25748587/pexels-photo-25748587.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25384540/pexels-photo-25384540.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 64,
                likes: 631,
                postTime: "38m",
              ),
              PostCard(
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/343564605_626154996028024_3429561118814250608_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=t7r5Bq45q4UQ7kNvgGJ6Hpt&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYDSCboBiz_i0HjdKxTrD-MCCgYBPyhsD2RyFNzznRjdKA&oe=666CD541&_nc_sid=10d13b",
                userName: "_plantswithkrystal_",
                text:
                    "If you're reading this, go water that thirsty plant. You're welcome ☺",
                replyUsersImg: [
                  "https://images.pexels.com/photos/25380746/pexels-photo-25380746/free-photo-of-iluminacion-creativa-con-fotex.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25372314/pexels-photo-25372314.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25328919/pexels-photo-25328919.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 8,
                likes: 74,
                postTime: "2h",
                isCertified: true,
              ),
              PostCard(
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/241723143_267876151820815_7763756124386005590_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=32n4br9GqJQQ7kNvgEsnzed&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYCYxj5a64A7USb6aG7HPd0PDIaa9W5RIFrTK1Y1YnPU0A&oe=666CDC76&_nc_sid=10d13b",
                userName: "terracottacoco",
                postImg: [
                  "https://pleated-jeans.com/wp-content/uploads/2023/06/gardening-humour-memes-23.jpg"
                ],
                replyUsersImg: [
                  "https://images.pexels.com/photos/25313428/pexels-photo-25313428.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25315803/pexels-photo-25315803.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/18836829/pexels-photo-18836829.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 42,
                likes: 158,
                postTime: "3h",
                isCertified: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
