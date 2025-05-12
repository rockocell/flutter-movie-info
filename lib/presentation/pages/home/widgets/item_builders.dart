import 'package:flutter/material.dart';
import 'package:movie_info_app/presentation/pages/detail/detail_page.dart';

// 현재 상영중
Widget nowPlayingItemBuilder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DetailPage();
          },
        ),
      );
    },
    child: Container(
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('http://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

// 인기순
Widget popularItemBuilder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DetailPage();
          },
        ),
      );
    },
    child: SizedBox(
      height: 180,
      width: 160,
      child: Stack(
        children: [
          Positioned(
            left: 25,
            child: Container(
              height: 180,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('http://picsum.photos/200/300'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -5,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// 평점 높은순
Widget topRatedItemBuilder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DetailPage();
          },
        ),
      );
    },
    child: Container(
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('http://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

// 개봉예정
Widget upcomingItemBuilder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DetailPage();
          },
        ),
      );
    },
    child: Container(
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('http://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
