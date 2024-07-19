import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/controllers/authController.dart';
import '../../entities/Type.dart';
import '../../entities/Category.dart' as cat;
import '../../entities/Movement.dart';

late String authority;

Future<void> initializeEnv() async {
  await dotenv.load(fileName: ".env");
  authority = dotenv.env['AUTHORITY'] ?? '';
}

class ingresar_movimientos_controller extends GetxController {
  ingresar_movimientos_controller() {
    initializeEnv();
  }

  Rx<Type?> selectedTipo = Rx<Type?>(null);
  RxList<Type> tipos = <Type>[].obs;
  RxList<cat.Category> categorias = <cat.Category>[].obs;
  Rx<cat.Category?> selectedCategoria = Rx<cat.Category?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchTipos().then((_) => fetchCategorias());
  }

  Future<void> fetchTipos() async {
    try {
      final uri = Uri.parse('http://localhost:3000/api/tipo');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        tipos.value = jsonResponse.map((item) => Type.fromJson(item)).toList();
        if (tipos.isNotEmpty) {
          setSelectedTipo(tipos.first);
        }
      } else {
        Get.snackbar('Error', 'No se pudieron cargar los tipos');
      }
    } catch (error) {
      print('Error fetching types: $error');
      Get.snackbar('Error', 'No se pudieron cargar los tipos');
    }
  }

  Future<void> fetchCategorias() async {
    AuthController authController = AuthController();
    var token = await authController.getToken();

    final uri = Uri.parse('http://localhost:3000/api/categoria');
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token!
        },
        body: null);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse is Map<String, dynamic>) {
        List<cat.Category> combinedCategories = [];

        combinedCategories.addAll(_parseCategories(jsonResponse['Ingreso']));
        combinedCategories.addAll(_parseCategories(jsonResponse['Gasto']));
        combinedCategories.addAll(_parseCategories(jsonResponse['Ahorro']));

        categorias.value = combinedCategories;

        // Seleccionar la primera categoría del tipo seleccionado, si existe
        if (selectedTipo.value != null) {
          var categoriasDelTipo =
              categorias.where((c) => c.typeId == selectedTipo.value!.id);
          if (categoriasDelTipo.isNotEmpty) {
            setSelectedCategoria(categoriasDelTipo.first);
          } else {
            setSelectedCategoria(null);
          }
        }

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
      return categoryList
          .map((item) => cat.Category.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  cat.Category adaptarCategoria(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    int typeId = json['type_id'];

    Type? tipo = tipos.firstWhereOrNull((tipo) => tipo.id == typeId);

    if (tipo == null) {
      throw Exception('No se encontró el tipo con id $typeId');
    }

    return cat.Category(id: id, name: name, typeId: typeId);
  }

  void setSelectedTipo(Type? newValue) {
    selectedTipo.value = newValue;
    // Reiniciar la categoría seleccionada cuando se cambia el tipo
    setSelectedCategoria(null);
  }

  void setSelectedCategoria(cat.Category? newValue) {
    selectedCategoria.value = newValue;
  }

  Future<void> ingresarMovimiento(Movement movimiento) async {
    AuthController authController = AuthController();
    var token = await authController.getToken();

    print("Ingresa a controlador movimiento");
    final uri = Uri.parse('http://localhost:3000/api/ingresarMovimiento');

    final body = json.encode({
      'amount': movimiento.amount.toDouble(),
      'detail': movimiento.detail,
      'date': movimiento.date.toIso8601String(),
      'user_id': movimiento.user?.id,
      'category_id': movimiento.category?.id,
    });

    final response = await http.post(
      uri,
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
