import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app/data/dto/movie_detail_dto.dart';

void main() {
  test('MovieDetailDto : fromJson test', () {
    // sample Json
    const sampleJsonString = """
      {
        "adult": false, 
        "backdrop_path": "/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg",
        "belongs_to_collection": null,
        "budget": 180000000,
        "genres": [
          {"id": 28, "name": "Action"},
          {"id": 878, "name": "Science Fiction"},
          {"id": 12, "name": "Adventure"}
        ],
        "homepage": "https://www.marvel.com/movies/thunderbolts",
        "id": 986056,
        "imdb_id": "tt20969586",
        "original_language": "en",
        "original_title": "Thunderbolts*",
        "overview":
            "After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.",
        "popularity": 378.7319,
        "poster_path": "/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg",
        "production_companies": [
          {
            "id": 420,
            "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
            "name": "Marvel Studios",
            "origin_country": "US"
          },
          {
            "id": 176762,
            "logo_path": null,
            "name": "Kevin Feige Productions",
            "origin_country": "US"
          }
        ],
        "production_countries": [
          {"iso_3166_1": "US", "name": "United States of America"}
        ],
        "release_date": "2025-04-30",
        "revenue": 272154195,
        "runtime": 127,
        "spoken_languages": [
          {"english_name": "English", "iso_639_1": "en", "name": "English"},
          {"english_name": "Italian", "iso_639_1": "it", "name": "Italiano"},
          {"english_name": "Russian", "iso_639_1": "ru", "name": "Pусский"}
        ],
        "status": "Released",
        "tagline": "Everyone deserves a second shot.",
        "title": "Thunderbolts*",
        "video": false,
        "vote_average": 7.547,
        "vote_count": 743
      }
  """;
    final map = jsonDecode(sampleJsonString);
    final movieDetailDto = MovieDetailDto.fromJson(map);

    expect(movieDetailDto.adult, false);
  });
}
