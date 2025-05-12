import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/data/dto/movie_response_dto.dart';

void main() {
  test('MovieResponseDto : fromJson test', () {
    // sample Json
    const sampleJsonString = """
      {
        "adult": false,
        "backdrop_path": "/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg",
        "genre_ids": [
          28,
          878,
          12
        ],
        "id": 986056,
        "original_language": "en",
        "original_title": "Thunderbolts*",
        "overview": "After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.",
        "popularity": 378.7319,
        "poster_path": "/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg",
        "release_date": "2025-04-30",
        "title": "Thunderbolts*",
        "video": false,
        "vote_average": 7.547,
        "vote_count": 743
      }
""";
    // decode sampleJsonString to Map<String, dynamic> type
    final map = jsonDecode(sampleJsonString);
    // create DTO entity
    final movieResponseDto = MovieResponseDto.fromJson(map);

    // validate each field value
    expect(movieResponseDto.adult, false);
    expect(movieResponseDto.backdropPath, "/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg");
    expect(movieResponseDto.genreIds, [28, 878, 12]);
    expect(movieResponseDto.id, 986056);
    expect(movieResponseDto.originalLanguage, "en");
    expect(movieResponseDto.originalTitle, "Thunderbolts*");
    expect(
      movieResponseDto.overview,
      "After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.",
    );

    expect(movieResponseDto.popularity, 378.7319);
    expect(movieResponseDto.posterPath, "/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg");
    expect(movieResponseDto.releaseDate, '2025-04-30');
    expect(movieResponseDto.title, "Thunderbolts*");
    expect(movieResponseDto.video, false);
    expect(movieResponseDto.voteAverage, 7.547);
    expect(movieResponseDto.voteCount, 743);
  });
}
