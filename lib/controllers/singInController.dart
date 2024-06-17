// ignore_for_file: file_names

import 'package:get/get.dart';
import '../entities/User.dart';


// definimos la clase signinController que extiende getx -> getx
class SignInController extends GetxController {
  var user = User().obs; //observamos el user del User para detectar cambiazos
  var statusMessage = ''.obs; //usamos status message para que vea pantallas de estado

  //metodo para actulizado el nombre del usuario
  void updateName(String name) {
    user.update((user) {
      user?.name = name; //actualizamos el nombre
    });
  }

  //metodo para actualizar la contraseña del usuario
  void updateUserPassword(String password) {
    user.update((user) {
      user?.password = password; //
    });
  }

  //metodo para actualizar el username del usuario
  void updateUserName(String username) {
    user.update((user) {
      user?.username = username;
    });
  }

  Future<void> signIn() async {
    final String password = user.value.password ?? '';
    final String username = user.value.username ?? '';

    if (username.isNotEmpty && password.isNotEmpty) {
      const hardcodedName = 'testUser';
      const hardcodedPassword = '123456';

      if (username == hardcodedName && password == hardcodedPassword) {
        statusMessage.value = 'Sign-in successful';
      } else {
        statusMessage.value = 'Invalid username or password';
      }
    } else {
      statusMessage.value = 'Please enter both username and password';
    }
  }
}
