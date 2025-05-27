import 'package:movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:movie_info_app/data/dto/movie_response_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies();

  Future<List<MovieResponseDto>?> fetchPopularMovies();

  Future<List<MovieResponseDto>?> fetchTopRatedMovies();

  Future<List<MovieResponseDto>?> fetchUpcomingMovies();

  Future<MovieDetailDto?> fetchMovieDetail(int id);

  Future<List<MovieResponseDto>> fetchPopulars();
}
