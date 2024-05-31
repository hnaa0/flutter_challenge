class MovieDetailModel {
  final String title,
      originalTitle,
      posterPath,
      backdropPath,
      overview,
      releaseDate;
  final List<dynamic> genres;
  final int id, runtime, voteCount;
  final double voteAverage;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        originalTitle = json["original_title"],
        releaseDate = json["release_date"],
        posterPath = json["poster_path"],
        backdropPath = json["backdrop_path"],
        overview = json["overview"],
        genres = json["genres"],
        id = json["id"],
        runtime = json["runtime"],
        voteCount = json["vote_count"],
        voteAverage = json["vote_average"];
}
