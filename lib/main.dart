import 'package:flutter/material.dart';
import 'package:myapp/pages/Home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Main Page", home: HomePage(),);
  }
}
