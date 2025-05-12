import 'package:flutter/material.dart';
import 'package:movie_info_app/pages/detail/detail_page.dart';
import 'package:movie_info_app/pages/home/widgets/home_horizontal_list.dart';
import 'package:movie_info_app/pages/home/widgets/item_builders.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: AppBar().preferredSize.height),
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '가장 인기있는',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
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
            child: Hero(
              tag: 'most-popular-image',
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: AspectRatio(aspectRatio: 3 / 4),
              ),
            ),
          ),
          HomeHorizontalList(
            label: '현재 상영중',
            itemBuilder: nowPlayingItemBuilder,
          ),
          HomeHorizontalList(label: '인기순', itemBuilder: popularItemBuilder),
          HomeHorizontalList(label: '평점 높은순', itemBuilder: topRatedItemBuilder),
          HomeHorizontalList(label: '개봉예정', itemBuilder: upcomingItemBuilder),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
