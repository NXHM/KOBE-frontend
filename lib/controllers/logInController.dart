// ignore_for_file: file_names

import 'package:get/get.dart';
import '../entities/User.dart';


// definimos la clase signinController que extiende getx -> getx
class LogInController extends GetxController {
  var user = User().obs; 
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

  Future<void> createUser() async {
    final String password = user.value.password ?? '';
    final String username = user.value.username ?? '';
    final String name = user.value.name ?? '';
    final String email = user.value.email ?? '';

    if (username.isNotEmpty && password.isNotEmpty
     && name.isNotEmpty && email.isNotEmpty) {

      const hardcodedusername= 'testUser';
      const hardcodedPassword = '123456';
      const hardcodedname = "Nico God";
      const hardcodedemail = "nicogod@gmail.com";
      // Ta harcodeado porque cuando se haga back:v se borrara esto
      statusMessage.value = 'Log-in successful';
      
      //statusMessage.value = 'Invalid username or password';
      
    } else {
      statusMessage.value = 'Please enter all the require information';
    }
  }
}
