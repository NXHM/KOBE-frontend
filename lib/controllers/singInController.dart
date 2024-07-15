import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInResult {
  final bool isSuccess;
  final String message;
  final String? token;

  SignInResult({required this.isSuccess, required this.message, this.token});
}

class SignInController extends GetxController {
  var statusMessage = ''.obs;

  Future<SignInResult> signIn(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('https://bd1d-38-25-15-113.ngrok-free.app/api/loginUser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final token = responseData['token'];
          statusMessage.value = 'Sign-in successful';
          return SignInResult(isSuccess: true, message: 'Sign-in successful', token: token);
        } else {
          statusMessage.value = 'Invalid username or password';
          return SignInResult(isSuccess: false, message: 'Invalid username or password');
        }
      } catch (e) {
        statusMessage.value = 'Error connecting to the server';
        return SignInResult(isSuccess: false, message: 'Error connecting to the server');
      }
    } else {
      statusMessage.value = 'Please enter both username and password';
      return SignInResult(isSuccess: false, message: 'Please enter both username and password');
    }
  }
}