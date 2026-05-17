import 'API calls.dart';
import 'movie_model.dart';

class MovieRepository {
  Future<List<MovieModel>> getTrendingMovies() async {
    final data = await ApiCalls.getTrendingMovies();

    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  Future<List<MovieModel>> getPopularMovies() async {
    final data = await ApiCalls.getPopularMovies();

    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
