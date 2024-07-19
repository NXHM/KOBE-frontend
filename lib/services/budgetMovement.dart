import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/controllers/authController.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

late String authority;

Future<void> initializeEnv() async {
  await dotenv.load(fileName: ".env");
  authority = dotenv.env['AUTHORITY'] ?? '';
}

class BudgetService {
  BudgetService(){
    initializeEnv();
  }

  Future<List<List<Map<String, dynamic>>>>
      getMovimientosYPresupuestosPorCategoria(int year, int month) async {
    AuthController authController = AuthController();
    var token = await authController.getToken();

    final uri = Uri.https(authority, 'api/budgetMovement');
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: jsonEncode(<String, int>{
        'year': year,
        'month': month,
      }),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => (item as List<dynamic>)
              .map((i) => i as Map<String, dynamic>)
              .toList())
          .toList();
    } else {
      throw Exception('Failed to load budgets and movements');
    }
  }
}
