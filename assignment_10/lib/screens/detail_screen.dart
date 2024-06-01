import 'dart:ui';
import 'package:assignment_10/services/api_service.dart';
import 'package:assignment_10/widgets/booking_button.dart';
import 'package:assignment_10/widgets/genre_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isLiked = false;
  late final SharedPreferences prefs;

  Future<void> _initLikeMovie(int id) async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.get("$id") != null) {
      _isLiked = true;
    } else {
      _isLiked = false;
    }
    setState(() {});
  }

  void _onLikeTap(int id) {
    if (_isLiked) {
      prefs.remove("$id");
    } else {
      prefs.setInt("$id", id);
    }

    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
    _initLikeMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Back to the list",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: ApiService().getDetail(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var detail = snapshot.data!;
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${detail.backdropPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 160,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 6,
                                  offset: const Offset(2, 3),
                                )
                              ],
                            ),
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${detail.posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              detail.originalTitle,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  detail.releaseDate,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    height: 1.2,
                                  ),
                                ),
                                Text(
                                  " | ${detail.runtime}분",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 4,
                              runSpacing: 8,
                              children: [
                                for (var item in detail.genres)
                                  GenreCard(
                                    genre: item["name"],
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Column(
                              children: [
                                Text(
                                  detail.overview,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BookingButton(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 12,
                  child: IconButton(
                    onPressed: () => _onLikeTap(widget.id),
                    icon: Icon(
                      Icons.favorite,
                      color: _isLiked ? Colors.red : Colors.grey.shade400,
                      size: 32,
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
