import 'package:flutter/material.dart';

import 'details.dart';
import 'home.dart';

void main() {
  runApp(ParentScreen());
}

class ParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

