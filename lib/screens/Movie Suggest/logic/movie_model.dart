class MovieModel {
  final int id;
  final String title;
  final String image;
  final double rating;
  final String overview;
  final String releaseDate;

  MovieModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,

      title: json['title'] ?? "",

      image:
      "https://image.tmdb.org/t/p/w500${json['poster_path']}",

      rating:
      (json['vote_average'] ?? 0).toDouble(),

      overview: json['overview'] ?? "",

      releaseDate: json['release_date'] ?? "",
    );
  }
}