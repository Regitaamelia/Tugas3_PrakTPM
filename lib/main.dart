import 'package:flutter/material.dart';
import '../view/page_search_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMBD Movie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary: Colors.orange[800]),
      ),
    home: PageSearchMovies(),
    );
  }
}