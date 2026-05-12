
import '../../../../models/movie_response.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final MovieResponse movieResponse;

  MovieSuccess(this.movieResponse);
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}