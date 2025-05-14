import 'package:flutter/material.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';

class DetailHorizontalList extends StatelessWidget {
  const DetailHorizontalList({
    super.key,
    required this.itemBuilder,
    required this.gapWidth,
    required this.movieDetail,
    required this.length,
  });

  final Widget Function(BuildContext context, int index, MovieDetail movie)
  itemBuilder;
  final double gapWidth;
  final MovieDetail movieDetail;
  final int length;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(width: gapWidth);
      },
      scrollDirection: Axis.horizontal,
      itemCount: length,

      itemBuilder: (context, index) => itemBuilder(context, index, movieDetail),
    );
  }
}
