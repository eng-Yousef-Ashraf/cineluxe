import 'package:cineluxe/models/movie_response.dart';
import 'package:cineluxe/screens/search_screen/logic/states/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/movie_list/repository/movie_repository.dart';

class SearchViewModel extends Cubit<SearchStates> {

  final MovieRepository repository;

  SearchViewModel(this.repository)
      : super(SearchMoviesInitialState());

  Future<void> searchMovies(String query) async {

    if (query.trim().isEmpty) {

      emit(SearchMoviesSuccessState([]));
      return;
    }

    emit(SearchMoviesLoadingState());

    try {

      final response =
      await repository.searchMovies(query);

      emit(
        SearchMoviesSuccessState(
          response.data?.movies ?? [],
        ),
      );

    } catch (e) {

      emit(
        SearchMoviesErrorState(
          e.toString(),
        ),
      );
    }
  }
}