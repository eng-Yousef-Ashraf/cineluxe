import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/movie_list/repository/movie_repository.dart';
import 'movie_states/movie_states.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository repository;

  MovieCubit(this.repository) : super(MovieInitial());

  dynamic latestMovies;
  dynamic categoryMovies;
  String currentGenre = 'action';

  final List<String> genres = [
    'action', 'comedy', 'drama', 'horror', 'sci-fi', 'animation', 'thriller'
  ];

  Future<void> getAllHomeData({String? genre, bool force = false}) async {
    final newGenre = genre ?? currentGenre;

    if (!force && state is MovieSuccess && newGenre == currentGenre) {
      return;
    }

    emit(MovieLoading());
    currentGenre = newGenre;

    try {
      if (latestMovies == null || force) {
        final latestResult = await repository.getMovies(sortBy: 'date_added');
        latestMovies = latestResult.data?.movies?.take(6).toList();
      }

      final categoryResult = await repository.getMovies(
        genre: newGenre,
        sortBy: 'date_added',
      );
      categoryMovies = categoryResult.data?.movies;

      emit(MovieSuccess(categoryResult));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> getRandomMovies() async {
    final randomGenre = (genres.where((g) => g != currentGenre).toList()..shuffle()).first;
    await getAllHomeData(genre: randomGenre, force: true);
  }
}