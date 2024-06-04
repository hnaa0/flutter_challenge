import 'package:assignment_10/screens/detail_screen.dart';
import 'package:assignment_10/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late SharedPreferences? prefs;
  final List<List<dynamic>> _movieList = [];
  bool _isLoading = true;

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    _initMovieList();
  }

  Future<void> _initMovieList() async {
    if (prefs == null) return;

    final prefsKeys = prefs!.getKeys();
    _movieList.clear();

    for (var key in prefsKeys) {
      var movieDetail = await ApiService().getDetail(int.parse(key));
      _movieList.add([movieDetail.id, movieDetail.posterPath]);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: TextStyle(
            fontSize: 18,
            fontFamily: GoogleFonts.kanit().fontFamily,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : _movieList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "It's empty!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        "Add your favorite movies🎬",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 20,
                    bottom: 80,
                  ),
                  itemCount: _movieList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    var movie = _movieList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(id: movie[0]),
                            )).then(
                          (value) {
                            if (value == true) _initMovieList();
                          },
                        );
                      },
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${movie[1]}",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
    );
  }
}
