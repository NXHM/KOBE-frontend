import 'package:get/get.dart';
import 'package:myapp/screens/widgets/auth.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  Future<String?> getToken() async {
    return await _authService.getToken();
  }

  Future<void> setToken(String token) async {
    await _authService.setToken(token);
    update();
  }

  Future<void> deleteToken() async {
    await _authService.deleteToken();
    update();
  }
}