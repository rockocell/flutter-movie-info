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

    // 각 객체, 객체 리스트
    final movieDetailDto = MovieDetailDto.fromJson(map);
    final productionCompanies =
        (map['production_companies'] as List)
            .map((e) => ProductionCompany.fromJson(e))
            .toList();
    final productionCountries =
        (map['production_countries'] as List)
            .map((e) => ProductionCountry.fromJson(e))
            .toList();
    final spokenLanguages =
        (map['spoken_languages'] as List)
            .map((e) => SpokenLanguage.fromJson(e))
            .toList();

    // 실제 테스트
    expect(movieDetailDto.adult, false);
    expect(movieDetailDto.backdropPath, "/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg");
    expect(movieDetailDto.belongsToCollection, null);
    expect(movieDetailDto.budget, 180000000);
    expect(
      movieDetailDto.homepage,
      "https://www.marvel.com/movies/thunderbolts",
    );
    expect(movieDetailDto.id, 986056);
    expect(movieDetailDto.imdbId, "tt20969586");
    expect(movieDetailDto.originalLanguage, "en");
    expect(movieDetailDto.originalTitle, "Thunderbolts*");
    expect(
      movieDetailDto.overview,
      "After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.",
    );
    expect(movieDetailDto.popularity, 378.7319);
    expect(movieDetailDto.posterPath, "/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg");
    expect(productionCompanies[0].id, 420);
    expect(productionCompanies[0].logoPath, "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png");
    expect(productionCompanies[0].name, "Marvel Studios");
    expect(productionCompanies[0].originCountry, "US");
    expect(productionCompanies[1].id, 176762);
    expect(productionCompanies[1].logoPath, null);
    expect(productionCompanies[1].name, "Kevin Feige Productions");
    expect(productionCompanies[1].originCountry, "US");
    expect(productionCountries[0].iso31661, "US");
    expect(productionCountries[0].name, "United States of America");
    expect(movieDetailDto.releaseDate, "2025-04-30");
    expect(movieDetailDto.revenue, 272154195);
    expect(movieDetailDto.runtime, 127);
    expect(spokenLanguages[0].englishName, "English");
    expect(spokenLanguages[0].iso6391, "en");
    expect(spokenLanguages[0].name, "English");
    expect(spokenLanguages[1].englishName, "Italian");
    expect(spokenLanguages[1].iso6391, "it");
    expect(spokenLanguages[1].name, "Italiano");
    expect(spokenLanguages[2].englishName, "Russian");
    expect(spokenLanguages[2].iso6391, "ru");
    expect(spokenLanguages[2].name, "Pусский");
    expect(movieDetailDto.status, "Released");
    expect(movieDetailDto.tagline, "Everyone deserves a second shot.");
    expect(movieDetailDto.title, "Thunderbolts*");
    expect(movieDetailDto.video, false);
    expect(movieDetailDto.voteAverage, 7.547);
    expect(movieDetailDto.voteCount, 743);
  });
}
