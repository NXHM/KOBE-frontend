import 'package:get/get.dart';
import '../entities/User.dart';

class EnterCodeController extends GetxController {
  var user = User().obs; 
  var statusMessage = ''.obs;

  Future<void> compareNewPasswords() async {
    final String tempCode = user.value.tempCode ?? ''; //
    const String sendCoded = '061912'; 

    if (sendCoded == (tempCode)) {
      statusMessage.value = "Código Válidado";
    } else {
      statusMessage.value = "Código Inválido";
    }
  }
}