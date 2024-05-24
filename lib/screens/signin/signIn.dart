import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/signin/login.dart';
import '../../controllers/singInController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/forgetPassword.dart';
class SignIn extends StatelessWidget {
  // Verifica si se cambia texto en los textbox
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInController signInController = Get.put(SignInController());
 SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 10, bottom: 25),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/Kobey-logo.jpeg',
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
                _inputField(context),
                _button(context),
                _linksLogin(context),
                Obx(() => Text(
                      signInController.statusMessage.value,
                      style: TextStyle(
                        color: signInController.statusMessage.value == 'Sign-in successful'
                            ? Colors.green
                            : Colors.red,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Textboxes
  Widget _inputField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField( // Nombre
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Nombre de Usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          TextField( // Contraseña
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Contraseña',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }

  // Button to sign in
  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          if (_nameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
            signInController.updateUserName(_nameController.text);
            signInController.updateUserPassword(_passwordController.text);
            signInController.signIn();
            if (signInController.statusMessage.value == 'Sign-in successful') {
              //Get.toNamed('/home'); // Navigate to the home page
              Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(builder: (context) => HomePage() )
          );
            }
  
          } else {
            Get.snackbar('Error', 'Please fill in all fields');
          }
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

  // Login links
  Widget _linksLogin(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextButton(
            onPressed: () {
               //Get.toNamed('/forgot_password'); 
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
            child: const Text(
              '¿Ha olvidado su contraseña?',
              style: TextStyle(color: TDColors.blueLogo),
            ),
          ),
        ),
        Padding( // Ir a Login
          padding: const EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              //Get.toNamed('/logIn');
              Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(builder: (context) => LogIn())
          );
            },
            child: const Text(
              '¿No tienes una cuenta? Regístrate',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
