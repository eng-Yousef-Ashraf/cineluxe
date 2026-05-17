import 'movie_model.dart';

abstract class MovieSuggestStates {}

class MovieSuggestInitial extends MovieSuggestStates {}

class MovieSuggestLoading extends MovieSuggestStates {}

class MovieSuggestSuccess extends MovieSuggestStates {
  final List<MovieModel> trendingMovies;

  final List<MovieModel> popularMovies;

  MovieSuggestSuccess({
    required this.trendingMovies,
    required this.popularMovies,
  });
}

class MovieSuggestError extends MovieSuggestStates {
  final String message;

  MovieSuggestError(this.message);
}
