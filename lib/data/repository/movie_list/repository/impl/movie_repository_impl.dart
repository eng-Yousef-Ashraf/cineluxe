import 'package:cineluxe/models/movie_response.dart';

import '../../data_source/movie_remote_data_source.dart';
import '../movie_repository.dart';


class MovieRepositoryImpl implements MovieRepository {

  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<MovieResponse> getMovies({
    String sortBy = 'date_added',
    String? genre,
  }) async {

    final response =
    await movieRemoteDataSource.getMovies(
      sortBy: sortBy,
      genre: genre,
    );

    return MovieResponse.fromJson(response.data);
  }

  @override
  Future<Movies> getMovieDetails(int movieId) async{
    final movie =
    await movieRemoteDataSource.getMovieDetails(movieId);
    return Movies.fromJson(
      movie.data['data']['movie'],
    );
  }

}