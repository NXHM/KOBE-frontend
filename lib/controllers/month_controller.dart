import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/entities/Month.dart';
import 'package:myapp/controllers/authController.dart';

class MonthController extends GetxController {
  var months = <Month>[].obs;
  AuthController authController = Get.put(AuthController());
  RxInt id_selected = 1.obs;
  RxInt year_selected = 2024.obs;
  var years = [2024, 2025, 2026];

  @override
  void onInit() {
    super.onInit();
    ResetValues();
    fetchMonths();
  }

  Future<void> fetchMonths() async {
    months.clear();
    var token = await authController.getToken();
    final response = await http.get(
        Uri.parse('http://localhost:3000/api/meses'),
        headers: {"Authorization": token!, "Content-Type": "application/json"});
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      months.value = jsonResponse.map((item) => Month.fromJson(item)).toList();
    } else {
      Get.snackbar('Error', 'No se pudieron cargar los meses');
    }
  }

  void ResetValues() {
    id_selected.value = DateTime.now().month;
    year_selected.value = DateTime.now().year;
  }
}
