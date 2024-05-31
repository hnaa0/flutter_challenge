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
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FutureBuilder(
            future: ApiService().getDetail(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var detail = snapshot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${detail.posterPath}",
                    fit: BoxFit.cover,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          )
        ],
      ),
    );
  }
}
