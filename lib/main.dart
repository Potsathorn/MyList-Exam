import 'package:MyList/Pages/Home.dart';
import 'package:MyList/Pages/Show_Detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {'/showDtail_page':(context) => ShowDetail()},
    );
  }
}
