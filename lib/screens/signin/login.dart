import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/controllers/logInController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/signIn.dart';

class LogIn extends StatelessWidget {
  // Verifica si se cambia texto en los textbox
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final LogInController loginInController = Get.put(LogInController());
 LogIn({super.key});

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
                      loginInController.statusMessage.value,
                      style: TextStyle(
                        color: loginInController.statusMessage.value == 'Log In successful'
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
            child: 
            TextField( // Nombre
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Nombre Completo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: 
            TextField( // Nombre
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: 
            TextField( // Nombre
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_rounded),
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: 
            TextField( // Nombre
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Contraseña',
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
              labelText: 'Confirmar Contraseña',
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
      padding: const EdgeInsets.only(top: 50),
      child: ElevatedButton(
        onPressed: () {
          if (_nameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _repeatPasswordController.text.isNotEmpty) {
            ;
            if (loginInController.statusMessage.value == 'Sign-in successful') {
              Get.toNamed('/home'); // Navigate to the home page
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
              'Registrarse',
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
        Padding( // Iniciar sesion
          padding: const EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              //Get.toNamed('/sign_up');
              Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(builder: (context) => SignIn())
          );
            },
            child: const Text(
              '¿Ya tiene una cuenta? Inicie sesión',
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
