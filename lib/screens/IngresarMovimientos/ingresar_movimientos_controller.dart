import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';
import '../../entities/Type.dart';
import '../../entities/Category.dart' as cat;
import '../../entities/Movement.dart';

class ingresar_movimientos_controller extends GetxController {
  Rx<Type?> selectedTipo = Rx<Type?>(null);
  RxList<Type> tipos = <Type>[].obs;
  RxList<cat.Category> categorias = <cat.Category>[].obs;

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
    AuthController authController = AuthController();
    var token = await authController.getToken();

    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/categoria'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: null
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse is Map<String, dynamic>) {
        // Extraer y combinar las listas de categorías
        List<cat.Category> combinedCategories = [];

        combinedCategories.addAll(_parseCategories(jsonResponse['Ingreso']));
        combinedCategories.addAll(_parseCategories(jsonResponse['Gasto']));
        combinedCategories.addAll(_parseCategories(jsonResponse['Ahorro']));

        // Asignar la lista combinada a la variable de categorías
        categorias.value = combinedCategories;

        print(categorias);
      } else {
        Get.snackbar('Error', 'Formato de respuesta no esperado');
      }
    } else {
      Get.snackbar('Error', 'No se pudieron cargar las categorías');
    }
  }

  List<cat.Category> _parseCategories(dynamic categoryList) {
    if (categoryList is List) {
      return categoryList.map((item) => cat.Category.fromJson(item as Map<String, dynamic>)).toList();
    }
    return [];
  }

  cat.Category adaptarCategoria(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    int typeId = json['type_id']; // Usar tipo_id del JSON recibido

    // Buscar el Tipo correspondiente en la lista tipos
    Type? tipo = tipos.firstWhereOrNull((tipo) => tipo.id == typeId);

    if (tipo == null) {
      throw Exception('No se encontró el tipo con id $typeId');
    }

    return cat.Category(id: id, name: name, typeId: typeId);
  }

  void setSelectedTipo(Type? newValue) {
    selectedTipo.value = newValue;
  }

  Future<void> ingresarMovimiento(Movement movimiento) async {
    AuthController authController = AuthController();
    var token = await authController.getToken();

    print("Ingresa a controlador movimiento");
    final url = Uri.parse('http://10.0.2.2:3000/api/ingresarMovimiento');

    final body = json.encode({
      'amount': movimiento.amount.toDouble(),
      'detail': movimiento.detail,
      'date': movimiento.date.toIso8601String(),
      'user_id': movimiento.user?.id,
      'category_id': movimiento.category?.id,
    });

    print("BODY");
    print(body);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': token!},
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
