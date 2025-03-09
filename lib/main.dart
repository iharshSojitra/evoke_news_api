import 'package:evoke_news_api/screens/details_screen.dart';
import 'package:evoke_news_api/screens/home_screen.dart';
import 'package:evoke_news_api/screens/tab_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarScreen(),
    );
  }
}
