import 'package:flutter/material.dart';


class Description extends StatelessWidget {
  final String description;
  const Description({super.key ,required this.description});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20,right: 5, left:5),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}