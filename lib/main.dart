import 'package:flutter/material.dart';
import 'package:movie_info_app/pages/detail/detail_page.dart';
import 'package:movie_info_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DetailPage(), theme: ThemeData.dark());
  }
}
