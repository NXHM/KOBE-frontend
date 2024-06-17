import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';

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
}
