/*import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../entities/Type.dart';
import '../../entities/Category.dart';
import '../../entities/Movement.dart';

class ingresar_movimientos_controller extends GetxController {
  Rx<Type?> selectedTipo = Rx<Type?>(null);
  RxList<Type> tipos = <Type>[].obs;
  RxList<Category> categorias = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTipos();
    fetchCategorias();
  }

  Future<void> fetchTipos() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/tipo'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      tipos.value = jsonResponse.map((item) => Type.fromJson(item)).toList();
    } else {
      Get.snackbar('Error', 'No se pudieron cargar los tipos');
    }
  }

  Future<void> fetchCategorias() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3000/api/categoria'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      categorias.value =
          jsonResponse.map((item) => adaptarCategoria(item)).toList();
    } else {
      Get.snackbar('Error', 'No se pudieron cargar las categorías');
    }
  }

  Category adaptarCategoria(Map<String, dynamic> json) {
    print("json");
    print(json);
    int id = json['id'];
    String name = json['name'];
    int tipoId = json['type_id']; // Usar tipo_id del JSON recibido
    double presupuesto = 1; // Asegurar que presupuesto sea un double

    // Buscar el Tipo correspondiente en la lista tipos
    Type? tipo = tipos.firstWhereOrNull((tipo) => tipo.id == tipoId);

    if (tipo == null) {
      throw Exception('No se encontró el tipo con id $tipoId');
    }

    return Category(id: id, name: name, type: tipo);
  }

  void setSelectedTipo(Type? newValue) {
    selectedTipo.value = newValue;
  }

  Future<void> ingresarMovimiento(Movement movimiento) async {
    print("Ingresa a controlador movimiento");
    final url = Uri.parse('http://10.0.2.2:3000/api/ingresarMovimiento');

    final body = json.encode({
      'amount': movimiento.amount.toDouble(),
      'detail': movimiento.detail,
      'date': movimiento.date.toIso8601String(),
      'user_id': movimiento.user.id,
      'category_id': movimiento.category.id,
    });

    print("BODY");
    print(body);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    print("RESPONSE");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      Get.snackbar('Éxito', 'Movimiento ingresado correctamente');
      print("Movimiento ingresado correctamente");
    } else {
      // Intenta obtener un mensaje de error del cuerpo de la respuesta si está disponible
      String errorMessage = 'Hubo un problema al ingresar el movimiento';
      if (response.body.isNotEmpty) {
        try {
          var errorJson = json.decode(response.body);
          errorMessage = errorJson['message'] ?? errorMessage;
        } catch (e) {
          print('Error al decodificar mensaje de error: $e');
        }
      }
      Get.snackbar('Error', errorMessage);
      print("Hubo un problema al ingresar el movimiento: $errorMessage");
    }
  }
}
*/