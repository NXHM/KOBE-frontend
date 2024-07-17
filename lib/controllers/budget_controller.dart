import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/controllers/month_controller.dart';

class BudgetController extends GetxController {
  var groupedBudgets = <String, List<Map<String, dynamic>>>{}.obs;
  AuthController authController = Get.put(AuthController());
  MonthController monthController = Get.put(MonthController());

  Future<void> fetchGroupedBudgets() async {
    groupedBudgets.clear();
    var token = await authController.getToken();
    print(token);
    print(
        'Fetching grouped budgets for month_id: ${monthController.id_selected.value}');
    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/presupuestos/tipo?month_id=${monthController.id_selected.value}'), // Pasar el parámetro month_id en la URL
      headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZiIsImlkIjoxLCJpYXQiOjE3MjExODE3MTAsImV4cCI6MTcyMTE4NTMxMH0.dAIhKXzeUAWia2K_pKHJumWsjOKID-OHnGzEYrAqQ8c",
        'Content-Type': 'application/json'
      },
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
}
