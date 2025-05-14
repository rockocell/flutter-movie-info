import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';
import 'package:movie_info_app/presentation/providers.dart';

class DetailViewModel extends Notifier<MovieDetail?> {
  @override
  MovieDetail? build() {
    fetchMovieDetail();
    return null;
  }

  Future<void> fetchMovieDetail() async {
    final fetchMovieDetailUsecase = ref.read(fetchMovieDetailUsecaseProvider);

    final id = ref.read(movieIdProvider);
    if (id == null) return; // id가 null 인 경우 처리
    final result = await fetchMovieDetailUsecase.execute(id);
    state = result;
  }
}
