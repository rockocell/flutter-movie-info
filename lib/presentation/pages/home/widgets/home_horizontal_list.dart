import 'package:flutter/material.dart';
import 'package:movie_info_app/domain/entity/movie.dart';

class HomeHorizontalList extends StatelessWidget {
  const HomeHorizontalList({
    super.key,
    required this.label,
    required this.itemBuilder,
    required this.items,
  });

  final String label;
  final Widget Function(BuildContext context, Movie movie, int index)
  itemBuilder;
  final List<Movie> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder:
                (context, index) => itemBuilder(context, items[index], index),
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }
}
