import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/domain/usecase/fetch_movie_detail_usecase.dart';

class MockFetchMovieDetailUsecase extends Mock
    implements FetchMovieDetailUsecase {}

late MockFetchMovieDetailUsecase mockFetchMovieDetailUsecase;

void main() {
  late ProviderContainer? providerContainer;

  setUp(() {
    mockFetchMovieDetailUsecase = MockFetchMovieDetailUsecase();
  });

  test('DetailViewModel test : state update after fetchNowPlayingMovies', () {
    // TODO: UI 연결 및 MovieIdProvider 업데이트 기능 구현 후 테스트 구현
  });
}
