import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/presentation/providers.dart';

// 하나의 뷰모델에서 4가지 상태를 다루기 때문에 상태들을 객체에 담아 관리
class HomeState {
  final List<Movie>? nowPlaying;
  final List<Movie>? popular;
  final List<Movie>? topRated;
  final List<Movie>? upcoming;

  const HomeState({
    this.nowPlaying,
    this.popular,
    this.topRated,
    this.upcoming,
  });

  // 상태 변경은 copyWith으로 처리해서 하나를 처리할 때 나머지 3개는 유지되도록
  HomeState copyWith({
    List<Movie>? nowPlaying,
    List<Movie>? popular,
    List<Movie>? topRated,
    List<Movie>? upcoming,
  }) {
    return HomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    fetchNowPlayingMovies();
    fetchPopularMovies();
    fetchTopRatedMovies();
    fetchUpcomingMovies();
    return const HomeState(
      nowPlaying: [],
      popular: [],
      topRated: [],
      upcoming: [],
    );
  }

  Future<void> fetchNowPlayingMovies() async {
    final result =
        await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();
    state = state.copyWith(nowPlaying: result);
  }

  Future<void> fetchPopularMovies() async {
    final result = await ref.read(fetchPopularMoviesUsecaseProvider).execute();
    state = state.copyWith(popular: result);
  }

  Future<void> fetchTopRatedMovies() async {
    final result = await ref.read(fetchTopRatedMoviesUsecaseProvider).execute();
    state = state.copyWith(topRated: result);
  }

  Future<void> fetchUpcomingMovies() async {
    final result = await ref.read(fetchUpcomingMoviesUsecaseProvider).execute();
    state = state.copyWith(upcoming: result);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});

///
///
///
///
class PopularsProvider extends AutoDisposeAsyncNotifier<List<Movie>> {
  @override
  Future<List<Movie>> build() async {
    return await fetchPopulars();
  }

  Future<List<Movie>> fetchPopulars() async {
    try {
      final popularMovies =
          await ref.read(fetchPopularsUsecaseProvider).execute();
      state = AsyncValue.data(popularMovies);
      return popularMovies;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }
}

final popularsProvider =
    AutoDisposeAsyncNotifierProvider<PopularsProvider, List<Movie>>(
      () => PopularsProvider(),
    );
