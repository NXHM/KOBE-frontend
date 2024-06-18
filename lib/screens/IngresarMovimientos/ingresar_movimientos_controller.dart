import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';
import '../../entities/Movimiento.dart';

class ingresar_movimientos_controller extends GetxController {
  Rx<Tipo?> selectedTipo = Rx<Tipo?>(null);
  RxList<Tipo> tipos = <Tipo>[].obs;
  RxList<Categoria> categorias = <Categoria>[].obs;

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
      tipos.value = jsonResponse.map((item) => Tipo.fromJson(item)).toList();
    } else {
      Get.snackbar('Error', 'No se pudieron cargar los tipos');
    }
  }

  Future<void> fetchCategorias() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/categoria'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      categorias.value = jsonResponse.map((item) => adaptarCategoria(item)).toList();
    } else {
      Get.snackbar('Error', 'No se pudieron cargar las categorías');
    }
  }

  Categoria adaptarCategoria(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    int tipoId = json['tipo_id']; // Usar tipo_id del JSON recibido
    double presupuesto = double.parse(json['presupuesto'].toString()); // Asegurar que presupuesto sea un double

    // Buscar el Tipo correspondiente en la lista tipos
    Tipo? tipo = tipos.firstWhereOrNull((tipo) => tipo.id == tipoId);

    if (tipo == null) {
      throw Exception('No se encontró el tipo con id $tipoId');
    }

    return Categoria(id: id, name: name, tipo: tipo, presupuesto: presupuesto);
  }

  void setSelectedTipo(Tipo? newValue) {
    selectedTipo.value = newValue;
  }

  Future<void> ingresarMovimiento(Movimiento movimiento) async {
  print("Ingresa a controlador movimiento");
  final url = Uri.parse('http://10.0.2.2:3000/api/ingresarMovimiento');
  
  final body = json.encode({
    'fecha': movimiento.fecha.toIso8601String(),
    'tipo_id': movimiento.tipo.id,
    'categoria_id': movimiento.categoria.id,
    'monto': movimiento.monto,
    'comentario': movimiento.comentario,
    'usuario_id': movimiento.usuario.id,
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