import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/presentation/providers.dart';

class HomeViewModel extends Notifier<List<Movie>?> {
  @override
  List<Movie>? build() {
    fetchNowPlayingMovies();
    fetchPopularMovies();
    fetchTopRatedMovies();
    fetchUpcomingMovies();
    return [];
  }

  Future<void> fetchNowPlayingMovies() async {
    final fetchNowPlayingMoviesUsecase = ref.read(
      fetchNowPlayingMoviesUsecaseProvider,
    );
    final result = await fetchNowPlayingMoviesUsecase.execute();
    state = result;
  }

  Future<void> fetchPopularMovies() async {
    final fetchPopularMoviesUsecase = ref.read(
      fetchPopularMoviesUsecaseProvider,
    );
    final result = await fetchPopularMoviesUsecase.execute();
    state = result;
  }

  Future<void> fetchTopRatedMovies() async {
    final fetchTopRatedMoviesUsecase = ref.read(
      fetchTopRatedMoviesUsecaseProvider,
    );
    final result = await fetchTopRatedMoviesUsecase.execute();
    state = result;
  }

  Future<void> fetchUpcomingMovies() async {
    final fetchUpcomingMoviesUsecase = ref.read(
      fetchUpcomingMoviesUsecaseProvider,
    );
    final result = await fetchUpcomingMoviesUsecase.execute();
    state = result;
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Movie>?>(() {
  return HomeViewModel();
});
