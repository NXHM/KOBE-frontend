import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/screens/widgets/signInButton.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';
import 'package:myapp/screens/widgets/description.dart';
import 'package:get/get.dart';

class PasswordChanged extends StatelessWidget{
  
  PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleInitialPages(title:'Cambio realizado'),
            const Description(description:'Se ha modificado su contraseña de manera exitosa.'),
            const SignInButton()
            
            ,
          ],
        ),
      ),
    );
  }
}