import 'package:flutter/material.dart';
import 'package:movie_info_app/pages/detail/widgets/detail_horizontal_list.dart';
import 'package:movie_info_app/pages/detail/widgets/item_builders.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Hero(
              tag: 'most-popular-image',
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300'),
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
                      Text(
                        'title',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text('yyyy-mm-dd', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                Text('description about movie', style: TextStyle(fontSize: 14)),
                Text('mm분', style: TextStyle(fontSize: 14)),
                Divider(height: 25),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: DetailHorizontalList(
                    itemBuilder: categoryItemBuilder,
                    gapWidth: 8,
                  ),
                ),
                Divider(height: 25),
                Text('little longer subcription about movie' * 6),
                Divider(height: 25),
                SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '흥행정보',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: DetailHorizontalList(
                    itemBuilder: boxOfficeItemBuilder,
                    gapWidth: 12,
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: DetailHorizontalList(
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 9 / 5,
                        child: Container(color: Colors.white),
                      );
                    },
                    gapWidth: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
