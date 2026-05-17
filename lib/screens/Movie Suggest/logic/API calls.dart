import 'package:dio/dio.dart';

class ApiCalls {
  static final Dio dio = Dio();

  static const String apiKey = "YOUR_API_KEY";

  static Future<List<dynamic>> getTrendingMovies() async {
    final response = await dio.get(
      "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey",
    );

    return response.data['results'];
  }

  static Future<List<dynamic>> getPopularMovies() async {
    final response = await dio.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey",
    );

    return response.data['results'];
  }
}
