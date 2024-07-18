import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';

class CategoryController extends GetxController {
  var groupedCategory = <String, List<Map<String, dynamic>>>{}.obs;
  var selectedCategoryData = <String, dynamic>{}.obs;
  AuthController authController = Get.put(AuthController());
  var name_category = "".obs;

  Future<void> fetchTiposCategorias() async {
    groupedCategory.clear();
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
            .map((item) => {
                  'category_name': item['name'],
                  'id': item['id'],
                  'type_id': item['type_id'],
                })
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

  Future<void> fetchCategoriaById(int categoryId) async {
    var token = await authController.getToken();
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/getCategoriaporId/$categoryId'),
      headers: {"Authorization": token!, "Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      selectedCategoryData.value = jsonResponse;
      print('Category fetched successfully');
    } else {
      print('Error fetching category: ${response.statusCode}');
      Get.snackbar('Error', 'No se pudo cargar la categoría');
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    var token = await authController.getToken();
    final response = await http.delete(
      Uri.parse('http://localhost:3000/api/deletecategoria/$categoryId'),
      headers: {"Authorization": token!, "Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print('Category deleted successfully');
      Get.snackbar('Success', 'Category deleted successfully');
      fetchTiposCategorias(); // Actualizar las categorías después de eliminar
    } else {
      print('Error deleting category: ${response.statusCode}');
      Get.snackbar('Error', 'Failed to delete category');
    }
  }
}
