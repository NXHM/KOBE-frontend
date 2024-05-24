import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final Color color;
  final double progress;

  const ProgressBar({
    Key? key,
    required this.color,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    String stringProgress = (progress*100).toStringAsFixed(1);

    return Stack(
      children: [
        LinearProgressIndicator(
          value: progress,
          color: color,
          backgroundColor: Colors.grey[300],
          minHeight: 30,
          borderRadius: BorderRadius.circular(8),
        ),
        Center(
          heightFactor: 1.5,
          child: Text(
            "$stringProgress%",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ), 
            textAlign: TextAlign.center,)
        )
      ],
    );
  }
}