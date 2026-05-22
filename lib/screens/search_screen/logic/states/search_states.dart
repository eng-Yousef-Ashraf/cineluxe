import '../../../../models/movie_response.dart';

abstract class SearchStates {}


class SearchMoviesInitialState extends SearchStates {}

class SearchMoviesLoadingState extends SearchStates {}

class SearchMoviesSuccessState extends SearchStates {

  final List<Movies> movies;

  SearchMoviesSuccessState(this.movies);
}

class SearchMoviesErrorState extends SearchStates {

  final String error;

  SearchMoviesErrorState(this.error);
}