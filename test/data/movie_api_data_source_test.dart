import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/data/data_source/movie_api_data_source_impl.dart';

class MockDio extends Mock implements Dio {}

final mockResponseData = {
  'results': [
    {
      "adult": false,
      "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
      "genre_ids": [10752, 28],
      "id": 1241436,
      "original_language": "en",
      "original_title": "Warfare",
      "overview":
          "A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.",
      "popularity": 538.9681,
      "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
      "release_date": "2025-04-09",
      "title": "Warfare",
      "video": false,
      "vote_average": 7.135,
      "vote_count": 233,
    },
  ],
};

void main() {
  MockDio? mockDio;
  MovieApiDataSourceImpl? movieApi;

  setUp(() {
    mockDio = MockDio();
    movieApi = MovieApiDataSourceImpl(dio: mockDio!);
  });

  // fetchNowPlayingMovies test
  test(
    'MovieApiDataSourceImpl : fetchNowPlayingMovies return data test',
    () async {
      when(() {
        return mockDio!.get(any());
      }).thenAnswer(
        (_) async => Response(
          data: mockResponseData,
          // 실제 실행시에는 request url을 처리할 때 자동으로 채워지는 객체
          // 필수 옵션이므로 테스트 때에도 채워줘야 하지만, 테스트 때는 실제 서버 통신이 이뤄지지 않으므로 빈 path 넣음
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final results = await movieApi!.fetchNowPlayingMovies();
      expect(results![0].adult, false);
      expect(results[0].backdropPath, "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg");
      expect(results[0].genreIds, [10752, 28]);
    },
  );

  // fetchPopularMovies test
  test(
    'MovieApiDataSourceImpl : fetchPopularMovies return data test',
    () async {
      when(() {
        return mockDio!.get(any());
      }).thenAnswer(
        (_) async => Response(
          data: mockResponseData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final results = await movieApi!.fetchPopularMovies();
      expect(results![0].genreIds, [10752, 28]);
      expect(results[0].id, 1241436);
      expect(results[0].originalLanguage, "en");
    },
  );

  // fetchTopRatedMovies test
  test('MovieApiDataSourceImpl : fetchTopRatedMovies return data test', () async {
    when(() {
      return mockDio!.get(any());
    }).thenAnswer(
      (_) async => Response(
        data: mockResponseData,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final results = await movieApi!.fetchTopRatedMovies();
    expect(results![0].originalTitle, "Warfare");
    expect(
      results[0].overview,
      "A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.",
    );
    expect(results[0].popularity, 538.9681);
  });

  // fetchUpcomingMovies test
  test(
    'MovieApiDataSourceImpl : fetchUpcomingMovies return data test',
    () async {
      when(() {
        return mockDio!.get(any());
      }).thenAnswer(
        (_) async => Response(
          data: mockResponseData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final results = await movieApi!.fetchUpcomingMovies();
      expect(results![0].posterPath, "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg");
      expect(results[0].releaseDate, "2025-04-09");
      expect(results[0].title, "Warfare");
    },
  );

  // fetchMovieDetail test
  test('MovieApiDataSourceImpl : fetchMovieDetail return data test', () async {
    when(() {
      return mockDio!.get(any());
    }).thenAnswer(
      (_) async => Response(
        data: {
          "adult": false,
          "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
          "belongs_to_collection": null,
          "budget": 20000000,
          "genres": [
            {"id": 10752, "name": "War"},
            {"id": 28, "name": "Action"},
          ],
          "homepage": "https://a24films.com/films/warfare",
          "id": 1241436,
          "imdb_id": "tt31434639",
          "origin_country": ["US"],
          "original_language": "en",
          "original_title": "Warfare",
          "overview":
              "A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.",
          "popularity": 538.9681,
          "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
          "production_companies": [
            {
              "id": 284,
              "logo_path": "/6a26if3IKy7mlrQuGHHVp6ufQtF.png",
              "name": "DNA Films",
              "origin_country": "GB",
            },
            {
              "id": 41077,
              "logo_path": "/1ZXsGaFPgrgS6ZZGS37AqD5uU12.png",
              "name": "A24",
              "origin_country": "US",
            },
          ],
          "production_countries": [
            {"iso_3166_1": "GB", "name": "United Kingdom"},
            {"iso_3166_1": "US", "name": "United States of America"},
          ],
          "release_date": "2025-04-09",
          "revenue": 29865776,
          "runtime": 95,
          "spoken_languages": [
            {"english_name": "English", "iso_639_1": "en", "name": "English"},
            {"english_name": "Turkish", "iso_639_1": "tr", "name": "Türkçe"},
          ],
          "status": "Released",
          "tagline": "Everything is based on memory.",
          "title": "Warfare",
          "video": false,
          "vote_average": 7.135,
          "vote_count": 233,
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await movieApi!.fetchMovieDetail(1241436);
    expect(result!.id, 1241436);
    expect(result.popularity, 538.9681);
    expect(result.video, false);
  });
}
