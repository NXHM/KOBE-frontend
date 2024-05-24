import 'package:flutter/material.dart';


class TitleInitialPages extends StatelessWidget {
  final String title;
  const TitleInitialPages({super.key ,required this.title});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 5,right:5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}