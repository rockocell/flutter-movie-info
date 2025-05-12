import 'package:flutter/material.dart';

class DetailHorizontalList extends StatelessWidget {
  const DetailHorizontalList({
    super.key,
    required this.itemBuilder,
    required this.gapWidth,
  });

  final Widget Function(BuildContext context, int index) itemBuilder;
  final double gapWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(width: gapWidth);
      },
      scrollDirection: Axis.horizontal,
      itemCount: 6,

      itemBuilder: (context, index) => itemBuilder(context, index),
    );
  }
}
