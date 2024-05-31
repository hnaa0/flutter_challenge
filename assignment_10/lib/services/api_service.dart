import 'dart:convert';

import 'package:assignment_10/models/movie_detail_model.dart';
import 'package:assignment_10/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const Map<String, String> categorys = {
    "popular": "popular",
    "nowPlaying": "now-playing",
    "comingSoon": "coming-soon",
  };

  Future<List<MovieModel>> getMovies(String category) async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse("$baseUrl/${categorys[category]}");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(res.body)["results"];

      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }

    throw Error();
  }

  Future<MovieDetailModel> getDetail(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final detail = jsonDecode(res.body);

      return MovieDetailModel.fromJson(detail);
    }

    throw Error();
  }
}
