import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/entities/Category.dart';
import 'package:myapp/controllers/authController.dart';

class CategoryController extends GetxController {
  var groupedCategory = <String, List<Map<String, dynamic>>>{}.obs;
  AuthController authController = Get.put(AuthController());

  Future<void> fetchTiposCategorias() async {
    var token = await authController.getToken();
    final response = await http.get(
        Uri.parse('http://localhost:3000/api/categoriasTipo'),
        headers: {"Authorization": token!, "Content-Type": "application/json"});
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      var groupedData = <String, List<Map<String, dynamic>>>{};

      for (var group in jsonResponse) {
        var tipo = group['name'];
        var categorias = (group['Categories'] as List)
            .map((item) => {'category_name': item['name']})
            .toList();
        groupedData[tipo] = categorias;
      }

      groupedCategory.value = groupedData;
      print('Grouped categories updated');
    } else {
      print('Error: ${response.statusCode}');
      Get.snackbar('Error', 'No se pudieron cargar los presupuestos agrupados');
      return;
    }
  }
}
