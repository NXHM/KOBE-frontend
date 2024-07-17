import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';

class BudgetController extends GetxController {
  var groupedBudgets = <String, List<Map<String, dynamic>>>{}.obs;
  AuthController authController = Get.put(AuthController());

  Future<void> fetchGroupedBudgets({required int month_id}) async {
    var token = await authController.getToken();
    print('Fetching grouped budgets for month_id: $month_id');
    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/presupuestos/tipo?month_id=$month_id'), // Pasar el parámetro month_id en la URL
      headers: {"Authorization": token!, 'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
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
    } else {
      print('Error: ${response.statusCode}');
      Get.snackbar('Error', 'No se pudieron cargar los presupuestos agrupados');
    }
  }
}
