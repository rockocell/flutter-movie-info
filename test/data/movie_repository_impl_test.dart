import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:movie_info_app/data/dto/movie_response_dto.dart';
import 'package:movie_info_app/data/repository/movie_repository_impl.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

final sampleMovieResponseDto = MovieResponseDto(
  adult: false,
  backdropPath: 'backdropPath',
  genreIds: [1],
  id: 1234,
  originalLanguage: "en",
  originalTitle: "originalTitle",
  overview: "overview",
  popularity: 5.5,
  posterPath: "posterPath",
  releaseDate: "releaseDate",
  title: "title",
  video: false,
  voteAverage: 10.2,
  voteCount: 277,
);

final sampleMovieDetailDto = MovieDetailDto(
  adult: false,
  backdropPath: "backdropPath",
  belongsToCollection: "belongsToCollection",
  budget: 100,
  genres: [Genre(id: 1, name: 'Action'), Genre(id: 2, name: 'Comedy')],
  homepage: "homepage",
  id: 123,
  imdbId: "imdbId",
  originalLanguage: "en",
  originalTitle: "originalTitle",
  overview: "overview",
  popularity: 123.4,
  posterPath: "posterPath",
  productionCompanies: [
    ProductionCompany(
      id: 1,
      logoPath: "logoPath",
      name: "name",
      originCountry: "originCountry",
    ),
  ],
  productionCountries: [ProductionCountry(iso31661: "iso31661", name: "name")],
  releaseDate: "releaseDate",
  revenue: 123,
  runtime: 100,
  spokenLanguages: [
    SpokenLanguage(
      englishName: "englishName",
      iso6391: "iso6391",
      name: "name",
    ),
  ],
  status: "status",
  tagline: "tagline",
  title: "title",
  video: false,
  voteAverage: 123.4,
  voteCount: 123,
);

void main() {
  MockMovieDataSource? mockMovieDataSource;
  MovieRepositoryImpl? movieRepositoryImpl;

  setUp(() {
    mockMovieDataSource = MockMovieDataSource();
    // 가짜 MovieDataSource 객체를 파라미터로 받는 MovieRepositoryImpl 객체 생성
    // 순수 테스트 가능해짐
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieDataSource!);
  });

  // fetchNowPlayingMovies test
  test('MovieRepositoryImpl test : fetchNowPlayingMovies', () async {
    // 테스트하려는 메서드를 호출했을 때, sampleMovieResponse를 사용한 결과를 반환
    when(
      () => mockMovieDataSource!.fetchNowPlayingMovies(),
    ).thenAnswer((_) async => [sampleMovieResponseDto]);

    final result = await movieRepositoryImpl!.fetchNowPlayingMovies();
    expect(result!.length, 1);
    expect(result.first.id, 1234);
    expect(result.first.posterPath, "posterPath");
  });

  // fetchPopularMovies test
  test('MovieRepositoryImpl test : fetchPopularMovies', () async {
    when(
      () => mockMovieDataSource!.fetchPopularMovies(),
    ).thenAnswer((_) async => [sampleMovieResponseDto]);

    final result = await movieRepositoryImpl!.fetchPopularMovies();
    expect(result!.length, 1);
    expect(result.first.id, 1234);
    expect(result.first.posterPath, "posterPath");
  });

  // fetchTopRatedMovies test
  test('MovieRepositoryImpl test : fetchTopRatedMovies', () async {
    when(
      () => mockMovieDataSource!.fetchTopRatedMovies(),
    ).thenAnswer((_) async => [sampleMovieResponseDto]);

    final result = await movieRepositoryImpl!.fetchTopRatedMovies();
    expect(result!.length, 1);
    expect(result.first.id, 1234);
    expect(result.first.posterPath, "posterPath");
  });

  // fetchUpcomingMovies test
  test('MovieRepositoryImpl test : fetchUpcomingMovies', () async {
    when(
      () => mockMovieDataSource!.fetchUpcomingMovies(),
    ).thenAnswer((_) async => [sampleMovieResponseDto]);

    final result = await movieRepositoryImpl!.fetchUpcomingMovies();
    expect(result!.length, 1);
    expect(result.first.id, 1234);
    expect(result.first.posterPath, "posterPath");
  });

  // fetchMovieDetail test
  test('MovieRepositoryImpl test : fetchMovieDetail', () async {
    when(
      () => mockMovieDataSource!.fetchMovieDetail(any()),
    ).thenAnswer((_) async => sampleMovieDetailDto);

    final result = await movieRepositoryImpl!.fetchMovieDetail(
      sampleMovieDetailDto.id,
    );
    expect(result!.budget, 100);
    expect(result.genres, ['Action', 'Comedy']);
    expect(result.id, 123);
    expect(result.overview, "overview");
    expect(result.popularity, 123.4);
    expect(result.productionCompanyLogos, ["logoPath"]);
    expect(result.releaseDate, "releaseDate");
    expect(result.runtime, 100);
    expect(result.tagline, "tagline");
    expect(result.title, "title");
    expect(result.voteAverage, 123.4);
    expect(result.voteCount, 123);
  });
}
