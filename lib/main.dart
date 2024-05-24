import 'package:flutter/material.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/login.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: loginScreen(),
  )
);