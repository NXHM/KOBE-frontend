// ignore_for_file: avoid_print

import 'package:myapp/entities/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';
import 'package:get/get.dart';

class UserController {
  Future<User> getUser() async {
    try {
      AuthController authController = Get.find<AuthController>();
      final token = await authController.getToken();
      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': token};
      }

      final uri =
          Uri.https('1bc7-191-98-138-140.ngrok-free.app', 'api/getUser');
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        print('Failed to fetch user: ${response.statusCode}');
        return User(name: 'None', username: 'None', email: 'None');
      }
    } catch (error) {
      print('Error fetching user: $error');
      return User(name: 'None', username: 'None', email: 'None');
    }
  }

  void putUser(String name, String username) async {
    try {
      AuthController authController = Get.find<AuthController>();
      final token = await authController.getToken();
      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': token};
      }

      final uri =
          Uri.https('1bc7-191-98-138-140.ngrok-free.app', 'api/putUser');
      final body = {
        'name': name,
        'username': username,
      };
      final response = await http.put(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        print('User put successfully.');
      } else {
        print('Failed to put user: ${response.statusCode}');
      }
    } catch (error) {
      print('Error putting user: $error');
    }
  }

  void putEmail(String email) async {
    try {
      AuthController authController = Get.find<AuthController>();
      final token = await authController.getToken();
      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': token};
      }

      final uri =
          Uri.https('1bc7-191-98-138-140.ngrok-free.app', 'api/putEmail');
      final body = {
        'email': email,
      };
      final response = await http.put(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        print('User put successfully.');
      } else {
        print('Failed to put user: ${response.statusCode}');
      }
    } catch (error) {
      print('Error putting user: $error');
    }
  }

  void logoutUser() async {
    AuthController authController = Get.find<AuthController>();
    authController.deleteToken();
  }
}
