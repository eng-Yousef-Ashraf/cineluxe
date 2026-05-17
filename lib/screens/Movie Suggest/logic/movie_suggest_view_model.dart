import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_repository.dart';
import 'movie_suggest_states.dart';

class MovieSuggestCubit extends Cubit<MovieSuggestStates> {
  final MovieRepository repository;

  MovieSuggestCubit(this.repository) : super(MovieSuggestInitial());

  Future<void> getMovies() async {
    emit(MovieSuggestLoading());

    try {
      final trending = await repository.getTrendingMovies();

      final popular = await repository.getPopularMovies();

      emit(
        MovieSuggestSuccess(trendingMovies: trending, popularMovies: popular),
      );
    } catch (e) {
      emit(MovieSuggestError(e.toString()));
    }
  }
}
