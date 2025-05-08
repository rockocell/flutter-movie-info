import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
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
                  child: horizontalList(
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
                  child: horizontalList(
                    itemBuilder: boxOfficeItemBuilder,
                    gapWidth: 12,
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: horizontalList(
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

  ListView horizontalList({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required double gapWidth,
  }) {
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
