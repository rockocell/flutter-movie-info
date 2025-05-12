import 'package:flutter/material.dart';

Widget categoryItemBuilder(BuildContext context, int index) {
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
        'Adventure',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    ),
  );
}

Widget boxOfficeItemBuilder(BuildContext context, int index) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Spacer(),
        Text('6.949', style: TextStyle(fontSize: 16)),
        Text('평점', style: TextStyle(fontSize: 16)),
        Spacer(),
      ],
    ),
  );
}
