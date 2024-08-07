import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/screens/widgets/signInButton.dart';
import 'package:myapp/screens/widgets/titleInitialPages.dart';
import 'package:myapp/screens/widgets/description.dart';

class SuccessfulRegistration extends StatelessWidget{
  
  const SuccessfulRegistration({super.key});

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
             TitleInitialPages(title:'Registro Exitoso'),
            Padding(padding:  EdgeInsets.only(bottom: 100),
            child: 
               Description(description:'Su cuenta ha sido creada exitosamente.'
              ),
            ),
             SignInButton(),
          ],
        ),
      ),
    );
  }
}