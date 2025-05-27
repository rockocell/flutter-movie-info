import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:movie_info_app/data/dto/movie_response_dto.dart';

class MovieApiDataSourceImpl implements MovieDataSource {
  MovieApiDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies() async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing',
      );
      final List<MovieResponseDto> nowPlayingMovies =
          (response.data['results'] as List)
              .map((e) => MovieResponseDto.fromJson(e))
              .toList();
      return nowPlayingMovies;
    } catch (e) {
      log('Error occurred during fetching now playing movies: $e');
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>?> fetchPopularMovies() async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular',
      );
      final List<MovieResponseDto> popularMovies =
          (response.data['results'] as List)
              .map((e) => MovieResponseDto.fromJson(e))
              .toList();
      return popularMovies;
    } catch (e) {
      log('Error occurred during fetching popular movies: $e');
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>?> fetchTopRatedMovies() async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/top_rated',
      );
      final List<MovieResponseDto> topRatedMovies =
          (response.data['results'] as List)
              .map((e) => MovieResponseDto.fromJson(e))
              .toList();
      return topRatedMovies;
    } catch (e) {
      log('Error occurred during fetching top rated movies: $e');
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>?> fetchUpcomingMovies() async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming',
      );
      final List<MovieResponseDto> upcomingMovies =
          (response.data['results'] as List)
              .map((e) => MovieResponseDto.fromJson(e))
              .toList();
      return upcomingMovies;
    } catch (e) {
      log('Error occurred during fetching upcoming movies: $e');
      return null;
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await dio.get('https://api.themoviedb.org/3/movie/$id');

      final map = jsonDecode(response.toString());
      final MovieDetailDto movieDetail = MovieDetailDto.fromJson(map);
      return movieDetail;
    } catch (e) {
      log('Error occurred during fetching upcoming movies: $e');
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchPopulars() async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular',
    );
    final List<MovieResponseDto> popularMovies =
        (response.data['results'] as List)
            .map((e) => MovieResponseDto.fromJson(e))
            .toList();
    return popularMovies;
  }
}
