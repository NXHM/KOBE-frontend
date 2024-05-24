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
        leading: const IconButton(
          icon: TDIcons.backArrow,
          onPressed: null // no me funciono con pop
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleInitialPages(title:'Registro Exitoso'),
            Padding(padding: const EdgeInsets.only(bottom: 250),
            child: 
              const Description(description:'Su cuenta ha sido creada exitosamente.'
              ),
            ),
            const SignInButton(),
          ],
        ),
      ),
    );
  }
}