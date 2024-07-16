import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/screens/signin/successfulRegistration.dart';
import 'package:myapp/controllers/signUpController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/signIn.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final SignUpController signUpController = Get.put(SignUpController());

  SignUp({super.key});

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
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
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
                      signUpController.statusMessage.value,
                      style: TextStyle(
                        color: signUpController.statusMessage.value ==
                                'Sign-up successful'
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

  Widget _inputField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          _buildTextField(_nameController, 'Nombre Completo', Icons.person),
          _buildTextField(
              _usernameController, 'Nombre de Usuario', Icons.person),
          _buildTextField(
              _emailController, 'Correo electrónico', Icons.email_rounded),
          _buildTextField(_passwordController, 'Contraseña', Icons.lock,
              isPassword: true),
          _buildTextField(
              _repeatPasswordController, 'Confirmar Contraseña', Icons.lock,
              isPassword: true),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ElevatedButton(
        onPressed: () {
          if (_nameController.text.isNotEmpty &&
              _usernameController.text.isNotEmpty &&
              _emailController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty &&
              _repeatPasswordController.text.isNotEmpty) {
            signUpController.createUser(
              _nameController.text,
              _usernameController.text,
              _emailController.text,
              _passwordController.text,
              _repeatPasswordController.text,
            );
            if (signUpController.statusMessage.value == 'Sign-up successful') {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                      builder: (context) => const SuccessfulRegistration()));
            }
          } else {
            Get.snackbar('Error', 'Por favor, complete todos los campos');
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

  Widget _linksLogin(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute<void>(builder: (context) => SignIn()));
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
