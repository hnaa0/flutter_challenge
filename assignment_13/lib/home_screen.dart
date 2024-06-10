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
                postImg:
                    "https://scontent.cdninstagram.com/v/t51.29350-15/447310197_990965042244403_5405111307856853142_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjkweDEyNzkuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=9RDTepMlW48Q7kNvgFwFBDP&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzM4MDg4NjQ0MTQyMzkwMTc1NQ%3D%3D.2-ccb7-5&oh=00_AYCdgJWQhF9OCpSUxJfqiqRWFLoQVoY6fsQDbZAkx0UpZA&oe=666A7D59&_nc_sid=10d13b",
                text:
                    "Good morning Thriends ☀️ Let’s share some pictures and fun facts about our pets below 😍",
                likes: 391,
                replies: 36,
                likeUsersImg: [
                  "https://images.pexels.com/photos/19254459/pexels-photo-19254459.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/18244144/pexels-photo-18244144.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/20697751/pexels-photo-20697751.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"
                ],
              ),
              PostCard(
                isCertified: false,
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/358071180_1325473584674222_4054152726088729559_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=M2OkGJahSSEQ7kNvgGxkqZ_&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYBQZsGlb6KwpbhTS2KHLBhOSxTOYjmh5-KJZFq-SCpb6g&oe=666C8E51&_nc_sid=10d13b",
                userName: "thetinderblog",
                postTime: "5m",
                postImg:
                    "https://scontent.cdninstagram.com/v/t39.30808-6/448011516_18444745300031973_4991136993308068168_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjg5eDEyODkuc2RyLmYzMDgwOCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=1H8Nf_NCCLQQ7kNvgHhbxvZ&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzM4NTQwNzgzNzk5MTI3MzMxNA%3D%3D.2-ccb7-5&oh=00_AYArT5g8Tbdq5EaF9ikL9oUgOXTTCX8ljEYwqbMF7zlr1w&oe=666A932E&_nc_sid=10d13b",
                likes: 45,
                replies: 125,
                likeUsersImg: [
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
                likeUsersImg: [
                  "https://images.pexels.com/photos/25713558/pexels-photo-25713558.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/17468804/pexels-photo-17468804.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 2,
                likes: 4,
                postTime: "2h",
              ),
              PostCard(
                isCertified: true,
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/357668192_840453117721471_8841006477124502600_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=4xHF6BqBlGcQ7kNvgFNzPBE&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYBCzgZ5m-SuuLWLVE03xEuimuA5DYRx33zFf7XhcrWhKQ&oe=666CC704&_nc_sid=10d13b",
                userName: "shityoushouldcareabout",
                text:
                    "my phone feels like a vibrator with all these notifications rn",
                likeUsersImg: [
                  "https://images.pexels.com/photos/25810556/pexels-photo-25810556.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25748587/pexels-photo-25748587.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  "https://images.pexels.com/photos/25384540/pexels-photo-25384540.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                ],
                replies: 64,
                likes: 631,
                postTime: "2h",
              ),
              PostCard(
                avatarImg:
                    "https://scontent.cdninstagram.com/v/t51.2885-19/343564605_626154996028024_3429561118814250608_n.jpg?stp=dst-jpg_s640x640&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=t7r5Bq45q4UQ7kNvgGJ6Hpt&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYDSCboBiz_i0HjdKxTrD-MCCgYBPyhsD2RyFNzznRjdKA&oe=666CD541&_nc_sid=10d13b",
                userName: "_plantswithkrystal_",
                text:
                    "If you're reading this, go water that thirsty plant. You're welcome ☺",
                likeUsersImg: [
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
                postImg:
                    "https://pleated-jeans.com/wp-content/uploads/2023/06/gardening-humour-memes-23.jpg",
                likeUsersImg: [
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
