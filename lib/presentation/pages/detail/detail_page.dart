import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/core/util.dart';
import 'package:movie_info_app/presentation/pages/detail/detail_view_model.dart';
import 'package:movie_info_app/presentation/pages/detail/widgets/detail_horizontal_list.dart';
import 'package:movie_info_app/presentation/pages/detail/widgets/item_builders.dart';

final tag = '';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({
    super.key,
    required this.movieId,
    required this.posterPath,
    required this.heroTag,
  });
  final int movieId;
  final String posterPath;
  final String heroTag;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();

    ref.read(detailViewModelProvider.notifier).fetchMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(detailViewModelProvider);

    final isLoading = movieDetail == null;

    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Hero(
              tag: widget.heroTag,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(getImageUrl(widget.posterPath)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          movieDetail.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 100,
                        child: Text(
                          movieDetail.releaseDate,
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(movieDetail.tagline, style: TextStyle(fontSize: 14)),
                Text('${movieDetail.runtime}분', style: TextStyle(fontSize: 14)),
                Divider(height: 25),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: DetailHorizontalList(
                    itemBuilder: categoryItemBuilder,
                    gapWidth: 10,
                    movieDetail: movieDetail,
                    length: movieDetail.genres.length,
                  ),
                ),
                Divider(height: 25),
                Text(movieDetail.overview),
                Divider(height: 25),
                SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '흥행정보',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      boxofficeContainer(
                        label: '평점',
                        data: '${movieDetail.voteAverage}',
                      ),
                      SizedBox(width: 10),
                      boxofficeContainer(
                        label: '평점투표수',
                        data: '${movieDetail.voteCount}',
                      ),
                      SizedBox(width: 10),
                      boxofficeContainer(
                        label: '인기점수',
                        data: '${movieDetail.popularity}',
                      ),
                      SizedBox(width: 10),
                      boxofficeContainer(
                        label: '예산',
                        data: '${movieDetail.budget}',
                      ),
                      SizedBox(width: 10),
                      boxofficeContainer(
                        label: '수익',
                        data: '${movieDetail.revenue}',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: DetailHorizontalList(
                    itemBuilder: (context, index, moviedetail) {
                      final logoPath =
                          moviedetail.productionCompanyLogos[index];
                      if (logoPath == null) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        width: 170,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(getImageUrl(logoPath)),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    gapWidth: 10,
                    movieDetail: movieDetail,
                    length: movieDetail.productionCompanyLogos.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget boxofficeContainer({required String label, required String data}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Spacer(),
          Text(data, style: TextStyle(fontSize: 16)),
          Text(label, style: TextStyle(fontSize: 16)),
          Spacer(),
        ],
      ),
    );
  }
}
