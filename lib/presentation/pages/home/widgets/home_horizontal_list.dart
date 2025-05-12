import 'package:flutter/material.dart';

class HomeHorizontalList extends StatelessWidget {
  const HomeHorizontalList({
    super.key,
    required this.label,
    required this.itemBuilder,
  });

  final String label;
  final Widget Function(BuildContext context, int index) itemBuilder;

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
}
