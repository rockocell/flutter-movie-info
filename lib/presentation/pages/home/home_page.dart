import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/core/util.dart';
import 'package:movie_info_app/presentation/pages/detail/detail_page.dart';
import 'package:movie_info_app/presentation/pages/home/home_view_model.dart';
import 'package:movie_info_app/presentation/pages/home/widgets/home_horizontal_list.dart';
import 'package:movie_info_app/presentation/pages/home/widgets/item_builders.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    final nowPlaying = homeState.nowPlaying ?? [];
    final popular = homeState.popular ?? [];
    final topRated = homeState.topRated ?? [];
    final upcoming = homeState.upcoming ?? [];
    final mostPopular = popular.first;

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
                    image: NetworkImage(getImageUrl(mostPopular.posterPath)),
                    fit: BoxFit.cover,
                  ),
                ),
                child: AspectRatio(aspectRatio: 2 / 3),
              ),
            ),
          ),
          HomeHorizontalList(
            label: '현재 상영중',
            items: nowPlaying,
            itemBuilder: nowPlayingItemBuilder,
          ),
          HomeHorizontalList(
            label: '인기순',
            items: popular,
            itemBuilder: popularItemBuilder,
          ),
          HomeHorizontalList(
            label: '평점 높은순',
            items: topRated,
            itemBuilder: topRatedItemBuilder,
          ),
          HomeHorizontalList(
            label: '개봉예정',
            items: upcoming,
            itemBuilder: upcomingItemBuilder,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
