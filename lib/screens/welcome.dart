import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipOval(
            child: Image.asset('assets/images/Kobey-logo.jpeg',
            fit: BoxFit.cover,
            width: 200.0,
            height: 200.0,
            ),
          ),
          const SafeArea(
            child: Text("Welcome Andrea God")
            )

        ]
      )
    );
  }
}