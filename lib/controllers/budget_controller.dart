import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/controllers/month_controller.dart';

class BudgetController extends GetxController {
  var groupedBudgets = <String, List<Map<String, dynamic>>>{}.obs;
  AuthController authController = Get.put(AuthController());
  MonthController monthController = Get.put(MonthController());
  var presupuesto = 0.0.obs;

  Future<void> fetchGroupedBudgets() async {
    groupedBudgets.clear();
    var token = await authController.getToken();
    print(token);
    print(
        'Fetching grouped budgets for month_id: ${monthController.id_selected.value}');
    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/presupuestos/tipo?month_id=${monthController.id_selected.value}&year=${monthController.year_selected.value}'), // Pasar el parámetro month_id en la URL
      headers: {"Authorization": token!, 'Content-Type': 'application/json'},
    );
    print(response.statusCode);
    if (response.statusCode == 404) {
      return;
    }
    if (response.statusCode != 200) {
      print('Error: ${response.statusCode}');
      Get.snackbar('Error', 'No se pudieron cargar los presupuestos agrupados');
      return;
    }
    print('Response received: ${response.body}');
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
    print('Grouped budgets updated');
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
      print('Budget created successfully: ${response.body}');
      Get.snackbar('Success', 'Budget created successfully');
    } else {
      print('Error creating budget: ${response.statusCode}');
      Get.snackbar('Error', 'Failed to create budget');
    }
  }
}
