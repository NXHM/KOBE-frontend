import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/controllers/month_controller.dart';

class BudgetController extends GetxController {
  var groupedBudgets = <String, List<Map<String, dynamic>>>{}.obs;
  var selectedBudget = <String, dynamic>{}.obs;
  var presupuesto = 0.0.obs;
  var idBudget =
      0.obs; // Agrega esta línea para almacenar el ID del presupuesto
  AuthController authController = Get.put(AuthController());
  MonthController monthController = Get.put(MonthController());

  Future<void> fetchGroupedBudgets(
      {required int monthId, required int year}) async {
    groupedBudgets.clear();
    var token = await authController.getToken();
    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/presupuestos/tipo?month_id=$monthId&year=$year'),
      headers: {"Authorization": token!, 'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      var groupedData = <String, List<Map<String, dynamic>>>{};

      for (var group in jsonResponse) {
        var tipo = group['type'];
        var categorias = (group['budgets'] as List)
            .map((item) => {
                  'category_name': item['category_name'],
                  'amount': item['amount']
                })
            .toList();
        groupedData[tipo] = categorias;
      }

      groupedBudgets.value = groupedData;
    } else {
      Get.snackbar('Error', 'No se pudieron cargar los presupuestos agrupados');
    }
  }

  Future<void> fetchBudget({
    required int categoryId,
    required int monthId,
    required int year,
  }) async {
    var token = await authController.getToken();
    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/getBudget?category_id=$categoryId&month_id=$monthId&year=$year'),
      headers: {"Authorization": token!, 'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      selectedBudget.value = jsonResponse;
      presupuesto.value = jsonResponse['amount'];
      idBudget.value = jsonResponse['id']; // Actualiza el ID del presupuesto
      print('Budget fetched successfully');
    } else {
      print('Error fetching budget: ${response.statusCode}');
      Get.snackbar('Error', 'No se pudo cargar el presupuesto');
    }
  }

  Future<void> createBudget({
    required double amount,
    required int year,
    required int month_id,
    required String category_name,
    required int type_id,
  }) async {
    var token = await authController.getToken();
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/createBudget'),
      headers: {
        "Authorization": token!,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'amount': amount,
        'year': year,
        'month_id': month_id,
        'category_name': category_name,
        'type_id': type_id,
      }),
    );

    if (response.statusCode == 201) {
      Get.snackbar('Success', 'Budget created successfully');
    } else {
      Get.snackbar('Error', 'Failed to create budget');
    }
  }

  Future<void> updateBudget({
    required int id,
    required double amount,
  }) async {
    var token = await authController.getToken();
    final response = await http.put(
      Uri.parse('http://localhost:3000/api/updateBudget'),
      headers: {
        "Authorization": token!,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': id,
        'amount': amount,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      selectedBudget.value = jsonResponse;
      presupuesto.value = jsonResponse['amount'];
      print('Budget updated successfully');
      Get.snackbar('Success', 'Budget updated successfully');
    } else {
      print('Error updating budget: ${response.statusCode}');
      Get.snackbar('Error', 'Failed to update budget');
    }
  }
}
