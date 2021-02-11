import 'package:elearningapp/screen/courses_list.dart';
import 'package:elearningapp/screen/courses_list_choose.dart';
import 'package:elearningapp/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}