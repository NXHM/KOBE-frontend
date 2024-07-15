import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String username;
  final String name;
  final String email;

  User({required this.username, required this.name, required this.email});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class UserDataController {
  Future<User?> fetchUser() async {
    try {
      final uri = Uri.parse('http://192.168.120.188:3000/api/getUserData');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return User.fromJSON(json.decode(response.body));
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error fetching user data: $error');
      return null;
    }
  }
}
