import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';
import 'package:movie_info_app/presentation/providers.dart';

class DetailViewModel extends Notifier<MovieDetail?> {
  @override
  MovieDetail? build() {
    return null;
  }

  Future<void> fetchMovieDetail(int id) async {
    final result = await ref.read(fetchMovieDetailUsecaseProvider).execute(id);
    state = result;
  }
}

final detailViewModelProvider = NotifierProvider<DetailViewModel, MovieDetail?>(
  () {
    return DetailViewModel();
  },
);
