import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/entities/Type.dart';
import 'package:myapp/controllers/authController.dart';

class TypeController extends GetxController {
  var types = <Type>[].obs;
  RxInt id_selected = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTypes();
    id_selected.value = 1;
  }

  Future<void> fetchTypes() async {
    types.clear();
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/tipo'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      types.value = jsonResponse.map((item) => Type.fromJson(item)).toList();
    } else {
      Get.snackbar('Error', 'No se pudieron cargar los tipos');
    }
  }
}
