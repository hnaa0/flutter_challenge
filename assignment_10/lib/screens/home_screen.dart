import 'package:assignment_10/models/movie_model.dart';
import 'package:assignment_10/screens/favorite_screen.dart';
import 'package:assignment_10/services/api_service.dart';
import 'package:assignment_10/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> populars = ApiService().getMovies("popular");
  final Future<List<MovieModel>> nowPlayings =
      ApiService().getMovies("nowPlaying");
  final Future<List<MovieModel>> comingSoons =
      ApiService().getMovies("comingSoon");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "NUTFLIX🥜",
          style: TextStyle(
            fontFamily: GoogleFonts.kanit().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "POPULAR",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            CardList(
              movies: populars,
              isMainList: true,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "NOW",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            CardList(
              movies: nowPlayings,
              isMainList: false,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "COMING SOON",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            CardList(
              movies: comingSoons,
              isMainList: false,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 20,
              ),
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {},
                child: const Text("🥜🥜🥜"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
