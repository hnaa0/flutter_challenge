import 'dart:ui';
import 'package:assignment_10/services/api_service.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });

  final int id;

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
        future: ApiService().getDetail(id),
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
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                                height: 1.2,
                              ),
                              child: Row(
                                children: [
                                  Text(detail.releaseDate),
                                  Text(" | ${detail.runtime}분"),
                                ],
                              ),
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
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 3.5,
                                          offset: const Offset(1, 2),
                                        )
                                      ],
                                    ),
                                    child: Text(
                                      item["name"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
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
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text("Buy"),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 12,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.grey.shade400,
                      size: 32,
                    ),
                  ),
                )
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
