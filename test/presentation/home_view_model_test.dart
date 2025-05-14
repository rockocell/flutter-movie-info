import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:movie_info_app/presentation/pages/home/home_view_model.dart';
import 'package:movie_info_app/presentation/providers.dart';

class MockNowPlayingUsecase extends Mock
    implements FetchNowPlayingMoviesUsecase {}

class MockPopularUsecase extends Mock implements FetchPopularMoviesUsecase {}

class MockTopRatedUsecase extends Mock implements FetchTopRatedMoviesUsecase {}

class MockUpcomingUsecase extends Mock implements FetchUpcomingMoviesUsecase {}

late MockNowPlayingUsecase mockNowPlayingUsecase;
late MockPopularUsecase mockPopularUsecase;
late MockTopRatedUsecase mockTopRatedUsecase;
late MockUpcomingUsecase mockUpcomingUsecase;

void main() {
  late ProviderContainer providerContainer;

  setUp(() {
    mockNowPlayingUsecase = MockNowPlayingUsecase();
    mockPopularUsecase = MockPopularUsecase();
    mockTopRatedUsecase = MockTopRatedUsecase();
    mockUpcomingUsecase = MockUpcomingUsecase();
  });

  // fetchNowPlayingMovies test
  test(
    'HomeViewModel test : state update after fetchNowPlayingMovies',
    () async {
      when(
        () => mockNowPlayingUsecase.execute(),
      ).thenAnswer((_) async => [Movie(id: 123, posterPath: "posterPath")]);

      providerContainer = ProviderContainer(
        overrides: [
          fetchNowPlayingMoviesUsecaseProvider.overrideWith(
            (ref) => mockNowPlayingUsecase,
          ),
        ],
      );
      // 실행 전 상태 확인
      final stateBefore = providerContainer.read(homeViewModelProvider);
      expect(stateBefore!.length, 0);
      // 실행
      await providerContainer
          .read(homeViewModelProvider.notifier)
          .fetchNowPlayingMovies();
      // 실행 후 상태 확인
      final stateAfter = providerContainer.read(homeViewModelProvider);
      expect(stateAfter!.isEmpty, false);
      expect(stateAfter.length, 1);
      expect(stateAfter.first.id, 123);

      addTearDown(providerContainer.dispose);
    },
  );

  // fetchPopularMovies test
  test('HomeViewModel test : state update after fetchPopularMovies', () async {
    when(
      () => mockPopularUsecase.execute(),
    ).thenAnswer((_) async => [Movie(id: 123, posterPath: "posterPath")]);

    providerContainer = ProviderContainer(
      overrides: [
        fetchPopularMoviesUsecaseProvider.overrideWith(
          (ref) => mockPopularUsecase,
        ),
      ],
    );
    // 실행 전 상태 확인
    final stateBefore = providerContainer.read(homeViewModelProvider);
    expect(stateBefore!.length, 0);
    // 실행
    await providerContainer
        .read(homeViewModelProvider.notifier)
        .fetchPopularMovies();
    // 실행 후 상태 확인
    final stateAfter = providerContainer.read(homeViewModelProvider);
    expect(stateAfter!.isEmpty, false);
    expect(stateAfter.length, 1);
    expect(stateAfter.first.id, 123);

    addTearDown(providerContainer.dispose);
  });

  // fetchTopRatedMovies test
  test('HomeViewModel test : state update after fetchTopRatedMovies', () async {
    when(
      () => mockTopRatedUsecase.execute(),
    ).thenAnswer((_) async => [Movie(id: 123, posterPath: "posterPath")]);

    providerContainer = ProviderContainer(
      overrides: [
        fetchTopRatedMoviesUsecaseProvider.overrideWith(
          (ref) => mockTopRatedUsecase,
        ),
      ],
    );
    // 실행 전 상태 확인
    final stateBefore = providerContainer.read(homeViewModelProvider);
    expect(stateBefore!.length, 0);
    // 실행
    await providerContainer
        .read(homeViewModelProvider.notifier)
        .fetchTopRatedMovies();
    // 실행 후 상태 확인
    final stateAfter = providerContainer.read(homeViewModelProvider);
    expect(stateAfter!.isEmpty, false);
    expect(stateAfter.length, 1);
    expect(stateAfter.first.id, 123);

    addTearDown(providerContainer.dispose);
  });

  // fetchUpcomingMovies test
  test('HomeViewModel test : state update after fetchUpcomingMovies', () async {
    when(
      () => mockUpcomingUsecase.execute(),
    ).thenAnswer((_) async => [Movie(id: 123, posterPath: "posterPath")]);

    providerContainer = ProviderContainer(
      overrides: [
        fetchUpcomingMoviesUsecaseProvider.overrideWith(
          (ref) => mockUpcomingUsecase,
        ),
      ],
    );
    // 실행 전 상태 확인
    final stateBefore = providerContainer.read(homeViewModelProvider);
    expect(stateBefore!.length, 0);
    // 실행
    await providerContainer
        .read(homeViewModelProvider.notifier)
        .fetchUpcomingMovies();
    // 실행 후 상태 확인
    final stateAfter = providerContainer.read(homeViewModelProvider);
    expect(stateAfter!.isEmpty, false);
    expect(stateAfter.length, 1);
    expect(stateAfter.first.id, 123);

    addTearDown(providerContainer.dispose);
  });
}
