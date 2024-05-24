// ignore_for_file: file_names

import 'package:get/get.dart';
import '../model/UserModel.dart';


// definimos la clase signinController que extiende getx -> getx
class NewPasswordController extends GetxController {
  var user = UserModel().obs; //observamos el user del usermodel para detectar cambiazos
  var statusMessage = ''.obs; //usamos status message para que vea pantallas de estado

  //metodo para actulizado el nombre del usuario
  void updatePassword(String password) {
    user.update((user) {
      user?.password = password; //actualizamos el nombre
    });
  }

  Future<void> newPassword() async {
    final String password = user.value.password ?? '';
    const String newPassword = '123456';

    if (newPassword == password && newPassword.isNotEmpty) {

        updatePassword(newPassword);
        statusMessage.value = 'New Password';
      
    } else {
      statusMessage.value = 'Invalid password';
    }
  }
}
