class MovieDetailDto {
  final bool adult;
  final String backdropPath;
  final String? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetailDto.fromJson(Map<String, dynamic> map)
    : this(
        adult: map['adult'],
        backdropPath: map['backdrop_path'],
        belongsToCollection: map['belongs_to_collection'] as String?,
        budget: map['budget'],
        genres: (map['genres'] as List).map((e) => Genre.fromJson(e)).toList(),
        homepage: map['homepage'],
        id: map['id'],
        imdbId: map['imdb_id'],
        originalLanguage: map['original_language'],
        originalTitle: map['original_title'],
        overview: map['overview'],
        popularity: map['popularity'],
        posterPath: map['poster_path'],
        productionCompanies:
            (map['production_companies'] as List)
                .map((e) => ProductionCompany.fromJson(e))
                .toList(),
        productionCountries:
            (map['production_countries'] as List)
                .map((e) => ProductionCountry.fromJson(e))
                .toList(),
        releaseDate: map['release_date'],
        revenue: map['revenue'],
        runtime: map['runtime'],
        spokenLanguages:
            (map['spoken_languages'] as List)
                .map((e) => SpokenLanguage.fromJson(e))
                .toList(),
        status: map['status'],
        tagline: map['tagline'],
        title: map['title'],
        video: map['video'],
        voteAverage: map['vote_average'],
        voteCount: map['vote_count'],
      );

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection,
      'budget': budget,
      'genres': genres,
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies,
      'productionCountries': productionCountries,
      'releaseDate': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages,
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  Genre.fromJson(Map<String, dynamic> map)
    : this(id: map['id'], name: map['name']);

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany.fromJson(Map<String, dynamic> map)
    : this(
        id: map['id'],
        logoPath: map['logo_path'],
        name: map['name'],
        originCountry: map['origin_country'],
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({required this.iso31661, required this.name});

  ProductionCountry.fromJson(Map<String, dynamic> map)
    : this(iso31661: map['iso_3166_1'], name: map['name']);

  Map<String, dynamic> toJson() {
    return {'iso_3166_1': iso31661, 'name': name};
  }
}

class SpokenLanguage {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  SpokenLanguage.fromJson(Map<String, dynamic> map)
    : this(
        englishName: map['english_name'],
        iso6391: map['iso_639_1'],
        name: map['name'],
      );
  Map<String, dynamic> toJson() {
    return {'english_name': englishName, 'iso_639_1': iso6391, 'name': name};
  }
}
