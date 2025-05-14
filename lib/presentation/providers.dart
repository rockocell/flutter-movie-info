import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/data_source/movie_api_data_source_impl.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/repository/movie_repository_impl.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';
import 'package:movie_info_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:movie_info_app/network/dio_client.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieApiDataSourceImpl(dio: DioClient().dio); // 싱글톤 dio 설정
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

/// 이하 usecase Provider
///
final fetchNowPlayingMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchNowPlayingMoviesUsecase(movieRepo);
});

final fetchPopularMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchPopularMoviesUsecase(movieRepo);
});

final fetchTopRatedMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchTopRatedMoviesUsecase(movieRepo);
});

final fetchUpcomingMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchUpcomingMoviesUsecase(movieRepo);
});

final fetchMovieDetailUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchMovieDetailUsecase(movieRepo);
});

// FetchMovieDetailUsecase가 excute될 때 필요한 int id를 제공하는 Provider
// 초기에는 null 값만 있음
// 사용자 입력에 따라 값 업데이트
final movieIdProvider = StateProvider((ref) {
  final movieId = null;
  return movieId;
});
