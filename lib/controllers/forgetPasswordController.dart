import 'package:get/get.dart';
import '../model/UserModel.dart';

class ForgetPasswordController extends GetxController {
  var user = UserModel().obs; 
  var statusMessage = ''.obs;

  Future<void> sendEmail() async {
    final String email = user.value.email ?? ''; // Fix: use 'email' instead of 'password'
    const List<String> emails = ['nicogod@gmail.com', 'nicoultragod@gmail.com']; // Stored emails

    if (emails.contains(email)) {
      statusMessage.value = "Email enviado"; // Call API to send recovery email
    } else {
      statusMessage.value = "El correo no está asociado a alguna cuenta";
    }
  }
}