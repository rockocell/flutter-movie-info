import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/core/util.dart';
import 'package:movie_info_app/presentation/pages/detail/detail_page.dart';
import 'package:movie_info_app/presentation/pages/home/home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularsAsync = ref.watch(popularsProvider);
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
          Container(
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[800],
            ),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: popularsAsync.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Text(''),
                data: (data) {
                  final mostPopular = data.first;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailPage(
                              movieId: mostPopular.id,
                              posterPath: mostPopular.posterPath,
                              heroTag: 'mostPopular-${mostPopular.posterPath}',
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'mostPopular-${mostPopular.posterPath}',
                      child: Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              getImageUrl(mostPopular.posterPath),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: AspectRatio(aspectRatio: 2 / 3),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // HomeHorizontalList(
          //   label: '현재 상영중',
          //   items: nowPlaying,
          //   itemBuilder: nowPlayingItemBuilder,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '인기순',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 180,
                      width: 145,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 25,
                            child: Container(
                              height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[800],
                              ),
                              child: popularsAsync.when(
                                loading:
                                    () => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                error: (error, stackTrace) => Text(''),
                                data: (data) {
                                  final movie = data[index];
                                  final images = ref
                                      .read(popularsProvider.notifier)
                                      .getCachedImageProviders(data);
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return DetailPage(
                                              movieId: movie.id,
                                              posterPath: movie.posterPath,
                                              heroTag:
                                                  'popular-${movie.posterPath}',
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'popular-${movie.posterPath}',
                                      child: Container(
                                        height: 180,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          // 기존코드
                                          // image:DecorationImage(
                                          //   image: NetworkImage(
                                          //     getImageUrl(movie.posterPath),
                                          //   ),
                                          //   fit: BoxFit.cover,
                                          // ),
                                          //
                                          // 시도한 코드 1
                                          image: DecorationImage(
                                            image: images[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // 시도한 코드 2
                                        // child: Image(
                                        //   image: images[index],
                                        //   fit: BoxFit.cover,
                                        //   height: 180,
                                        //   width: 120,
                                        // ),
                                      ),
                                    ),
                                  );
                                },
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
                    );
                  },

                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
            ],
          ),
          // HomeHorizontalList(
          //   label: '평점 높은순',
          //   items: topRated,
          //   itemBuilder: topRatedItemBuilder,
          // ),
          // HomeHorizontalList(
          //   label: '개봉예정',
          //   items: upcoming,
          //   itemBuilder: upcomingItemBuilder,
          // ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
