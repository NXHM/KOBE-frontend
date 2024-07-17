import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/controllers/authController.dart';

class BudgetService {
  static const String _baseUrl = 'http://localhost:3000/api';

  Future<List<List<Map<String, dynamic>>>>
      getMovimientosYPresupuestosPorCategoria(int year, int month) async {
    AuthController authController = AuthController();
    var token = await authController.getToken();

    final response = await http.post(
      Uri.parse('$_baseUrl/budgetMovement'),
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
