import 'package:get/get.dart';
import '../../entities/Categoria.dart';
import '../../entities/Tipo.dart';

class CategoryController extends GetxController {
  var categories = <Categoria>[].obs;
  var types = <Tipo>[].obs;

  @override
  void onInit() {
    fetchCategories();
    fetchTypes();
    super.onInit();
  }

  void fetchCategories() {
    // Aquí deberías llamar a tu API o fuente de datos para obtener las categorías
    var fetchedCategories = [
      Categoria(id: 1, name: "Sueldo", tipo: Tipo(id: 1, name: "Ingreso"), presupuesto: 1400),
      Categoria(id: 2, name: "Dividendo", tipo: Tipo(id: 1, name: "Ingreso"), presupuesto: 40),
      Categoria(id: 3, name: "Comida", tipo: Tipo(id: 2, name: "Gasto"), presupuesto: 240),
      Categoria(id: 4, name: "Entretenimiento", tipo: Tipo(id: 2, name: "Gasto"), presupuesto: 100),
      Categoria(id: 5, name: "Ropa", tipo: Tipo(id: 2, name: "Gasto"), presupuesto: 300),
      Categoria(id: 6, name: "Departamento", tipo: Tipo(id: 3, name: "Ahorro"), presupuesto: 800),
    ];
    categories.value = fetchedCategories;
  }

  void fetchTypes() {
    // Aquí deberías llamar a tu API o fuente de datos para obtener los tipos
    var fetchedTypes = [
      Tipo(id: 1, name: "Ingreso"),
      Tipo(id: 2, name: "Gasto"),
      Tipo(id: 3, name: "Ahorro"),
    ];
    types.value = fetchedTypes;
  }

  void deleteCategory(Categoria categoria) {
    categories.remove(categoria);
  }

  void updateCategory(Categoria categoria) {
    int index = categories.indexWhere((c) => c.id == categoria.id);
    if (index != -1) {
      categories[index] = categoria;
      categories.refresh();
    }
  }

  void addCategory(Categoria categoria) {
    categories.add(categoria);
  }
}