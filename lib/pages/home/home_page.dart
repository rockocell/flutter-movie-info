import 'package:flutter/material.dart';

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
          Container(
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
          horizontalList(label: '현재 상영중', itemBuilder: nowPlayingItemBuilder),
          horizontalList(label: '인기순', itemBuilder: popularItemBuilder),
          horizontalList(label: '평점 높은순', itemBuilder: topRatedItemBuilder),
          horizontalList(label: '개봉예정', itemBuilder: upComingItemBuilder),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Column horizontalList({
    required String label,
    required Widget Function(BuildContext context, int index) itemBuilder,
  }) {
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
            itemBuilder: (context, index) => itemBuilder(context, index),
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }

  Widget nowPlayingItemBuilder(BuildContext context, int index) {
    return Container(
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('http://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget popularItemBuilder(BuildContext context, int index) {
    return SizedBox(
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
    );
  }

  Widget topRatedItemBuilder(BuildContext context, int index) {
    return Container(
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('http://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget upComingItemBuilder(BuildContext context, int index) {
    return Container(
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('http://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
