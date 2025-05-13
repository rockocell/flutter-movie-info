import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    try {
      final results = await _movieDataSource.fetchNowPlayingMovies();
      if (results == null) return null;
      return results
          .map((e) => Movie(id: e.id, posterPath: e.posterPath))
          .toList();
    } catch (e) {
      print('Repository : Error occurred fetchNowPlayingMovies : $e');
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    try {
      final results = await _movieDataSource.fetchPopularMovies();
      if (results == null) return null;
      return results
          .map((e) => Movie(id: e.id, posterPath: e.posterPath))
          .toList();
    } catch (e) {
      print('Repository : Error occurred fetchPopularMovies : $e');
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    try {
      final results = await _movieDataSource.fetchTopRatedMovies();
      if (results == null) return null;
      return results
          .map((e) => Movie(id: e.id, posterPath: e.posterPath))
          .toList();
    } catch (e) {
      print('Repository : Error occurred fetchTopRatedMovies : $e');
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    try {
      final results = await _movieDataSource.fetchUpcomingMovies();
      if (results == null) return null;
      return results
          .map((e) => Movie(id: e.id, posterPath: e.posterPath))
          .toList();
    } catch (e) {
      print('Repository : Error occurred fetchUpcomingMovies : $e');
      return null;
    }
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    try {
      final result = await _movieDataSource.fetchMovieDetail(id);
      if (result == null) return null;

      // List<Genre>에서 name만 뽑아서 List<String> 형태로 반환
      final getGenreNameList = result.genres.map((e) => e.name).toList();
      // List<ProductionCompany>에서 logoPath만 뽑아서 List<String?> 형태로 반환
      final getProductionCompanyLogoPathList =
          result.productionCompanies.map((e) => e.logoPath).toList();

      return MovieDetail(
        budget: result.budget,
        genres: getGenreNameList,
        id: id,
        productionCompanyLogos: getProductionCompanyLogoPathList,
        overview: result.overview,
        popularity: result.popularity,
        releaseDate: result.releaseDate,
        revenue: result.revenue,
        runtime: result.runtime,
        tagline: result.tagline,
        title: result.title,
        voteAverage: result.voteAverage,
        voteCount: result.voteCount,
      );
    } catch (e) {
      print('Repository : Error occurred fetchMovieDetail : $e');
      return null;
    }
  }
}
