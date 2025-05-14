import 'package:flutter/material.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';

Widget categoryItemBuilder(BuildContext context, int index, MovieDetail movie) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.transparent,
      border: Border.all(color: Colors.white, width: 1),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        movie.genres[index],
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    ),
  );
}
