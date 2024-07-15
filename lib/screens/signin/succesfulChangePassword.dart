import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/screens/widgets/signInButton.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';
import 'package:myapp/screens/widgets/description.dart';

class SuccessfulChangePassword extends StatelessWidget{
  
  const SuccessfulChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TitleInitialPages(title:'Cambio Realizado'),
            Padding(padding:  EdgeInsets.only(bottom: 100),
            child: 
               Description(description:'Se ha modificado su contraseña de manera exitosa.'
              ),
            ),
             SignInButton(),
          ],
        ),
      ),
    );
  }
}