import 'package:assignment_10/models/movie_model.dart';
import 'package:assignment_10/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
    required this.movies,
    required this.isMainList,
  });

  final Future<List<MovieModel>> movies;
  final bool isMainList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 260,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              id: movie.id,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: isMainList ? 270 : 150,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.3),
                                  blurRadius: 3.5,
                                  offset: const Offset(2, 3),
                                )
                              ],
                            ),
                            child: AspectRatio(
                              aspectRatio: isMainList ? 5 / 4 : 3 / 4,
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (!isMainList)
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    movie.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 16,
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
