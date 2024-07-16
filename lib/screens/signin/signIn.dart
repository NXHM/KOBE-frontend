import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/signin/signUp.dart';
import '../../controllers/singInController.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/forgetPassword.dart';
import 'package:myapp/screens/Home/homeSessioned.dart';
import 'package:myapp/controllers/authController.dart';


class SignIn extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInController signInController = Get.put(SignInController());
  //final storage = FlutterSecureStorage();
  final AuthController authController = Get.find<AuthController>();
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
                  padding: EdgeInsets.only(top: 10, bottom: 25),
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
                        color: signInController.statusMessage.value ==
                                'Sign-in successful'
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Nombre de Usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          TextField(
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

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () async {
          if (_usernameController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty) {
            final result = await signInController.signIn(
              _usernameController.text,
              _passwordController.text,
            );
            if (result.isSuccess) {
              // Guardar el token JWT
              await authController.setToken(result.token!);
              // Navegar a la página de inicio
              Navigator.pushReplacement(context,
                  MaterialPageRoute<void>(builder: (context) => HomePageSessioned()));
            } else {
              Get.snackbar('Error', result.message);
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

  Widget _linksLogin(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
            child: const Text(
              '¿Ha olvidado su contraseña?',
              style: TextStyle(color: TDColors.blueLogo),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute<void>(builder: (context) => SignUp()));
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
