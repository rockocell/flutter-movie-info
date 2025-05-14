import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';
import 'package:movie_info_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_upcoming_movies_usecase.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  // MockMovieRepository와 각 usecase들을 선언
  // setUp함수에서 초기화
  MockMovieRepository? mockMovieRepository;
  FetchNowPlayingMoviesUsecase? fetchNowPlayingMoviesUsecase;
  FetchPopularMoviesUsecase? fetchPopularMoviesUsecase;
  FetchTopRatedMoviesUsecase? fetchTopRatedMoviesUsecase;
  FetchUpcomingMoviesUsecase? fetchUpcomingMoviesUsecase;
  FetchMovieDetailUsecase? fetchMovieDetailUsecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    //
    fetchNowPlayingMoviesUsecase = FetchNowPlayingMoviesUsecase(
      mockMovieRepository!,
    );
    //
    fetchPopularMoviesUsecase = FetchPopularMoviesUsecase(mockMovieRepository!);
    //
    fetchTopRatedMoviesUsecase = FetchTopRatedMoviesUsecase(
      mockMovieRepository!,
    );
    //
    fetchUpcomingMoviesUsecase = FetchUpcomingMoviesUsecase(
      mockMovieRepository!,
    );
    //
    fetchMovieDetailUsecase = FetchMovieDetailUsecase(mockMovieRepository!);
  });

  // FetchNowPlayingMoviesUsecase test
  test('FetchNowPlayingMoviesUsecase test : fetchNowPlayingMovies', () async {
    // 가짜 레포지토리에서 fetchNowPlayingMovies를 호출하면 아래의 List<Movie> 반환되도록 설정
    when(() => mockMovieRepository!.fetchNowPlayingMovies()).thenAnswer(
      (invocation) async => [Movie(id: 123, posterPath: "posterPath")],
    );

    // execute 실행
    final result = await fetchNowPlayingMoviesUsecase!.execute();

    // 결과 검증
    expect(result!.length, 1);
    expect(result.first.id, 123);
    expect(result.first.posterPath, "posterPath");
  });

  // FetchPopularMoviesUsecase test
  test('FetchPopularMoviesUsecase test : fetchPopularMovies', () async {
    when(() => mockMovieRepository!.fetchPopularMovies()).thenAnswer(
      (invocation) async => [Movie(id: 123, posterPath: "posterPath")],
    );

    final result = await fetchPopularMoviesUsecase!.execute();

    expect(result!.length, 1);
    expect(result.first.id, 123);
    expect(result.first.posterPath, "posterPath");
  });

  // FetchTopRatedMoviesUsecase test
  test('FetchTopRatedMoviesUsecase test : fetchTopRatedMovies', () async {
    when(() => mockMovieRepository!.fetchTopRatedMovies()).thenAnswer(
      (invocation) async => [Movie(id: 123, posterPath: "posterPath")],
    );

    final result = await fetchTopRatedMoviesUsecase!.execute();

    expect(result!.length, 1);
    expect(result.first.id, 123);
    expect(result.first.posterPath, "posterPath");
  });

  // FetchUpcomingMoviesUsecase test
  test('FetchUpcomingMoviesUsecase test : fetchUpcomingMovies', () async {
    when(() => mockMovieRepository!.fetchUpcomingMovies()).thenAnswer(
      (invocation) async => [Movie(id: 123, posterPath: "posterPath")],
    );

    final result = await fetchUpcomingMoviesUsecase!.execute();

    expect(result!.length, 1);
    expect(result.first.id, 123);
    expect(result.first.posterPath, "posterPath");
  });

  // FetchMovieDetailUsecase test
  test('FetchMovieDetailUsecase test : fetchMovieDetail', () async {
    // 가짜 레포지토리에서 fetchMovieDetail 호출하면 MovieDetail 객체 반환하도록 설정
    when(() => mockMovieRepository!.fetchMovieDetail(any())).thenAnswer(
      (invocation) async => MovieDetail(
        budget: 1000,
        genres: ['Action'],
        id: 123,
        productionCompanyLogos: ['productionCompanyLogos'],
        overview: "overview",
        popularity: 555,
        releaseDate: '2025-01-01',
        revenue: 999,
        runtime: 120,
        tagline: "tagline",
        title: "title",
        voteAverage: 100.1,
        voteCount: 777,
      ),
    );

    final result = await fetchMovieDetailUsecase!.execute(1);

    expect(result!.budget, 1000);
    expect(result.genres, ['Action']);
    expect(result.id, 123);
    expect(result.productionCompanyLogos, ['productionCompanyLogos']);
    expect(result.overview, "overview");
    expect(result.popularity, 555);
    expect(result.releaseDate, '2025-01-01');
    expect(result.revenue, 999);
    expect(result.runtime, 120);
    expect(result.tagline, "tagline");
    expect(result.title, "title");
    expect(result.voteAverage, 100.1);
    expect(result.voteCount, 777);
  });
}
