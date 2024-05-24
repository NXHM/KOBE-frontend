import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/signIn.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          //Get.toNamed('/signin'); // envia a la pagina login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(builder: (context) => SignIn())
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          backgroundColor: TDColors.blueLogo,
        ),
        child: const SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}