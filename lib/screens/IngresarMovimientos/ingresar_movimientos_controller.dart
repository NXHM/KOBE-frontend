import 'package:get/get.dart';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';

class ingresar_movimientos_controller extends GetxController {
  Rx<Tipo?> selectedTipo = Rx<Tipo?>(null);
  List<Tipo> tipos = [
    Tipo(id: 1, name: 'Ingreso'),
    Tipo(id: 2, name: 'Gasto'),
    Tipo(id: 3, name: 'Ahorro'),
  ];

  List<Categoria> categorias = [
    Categoria(id: 1, name: 'Comida', tipo: Tipo(id: 2, name: 'Gasto'), presupuesto: 240),
    Categoria(id: 2, name: 'Transporte', tipo: Tipo(id: 2, name: 'Gasto'), presupuesto: 100),
    Categoria(id: 3, name: 'Salud', tipo: Tipo(id: 2, name: 'Gasto'), presupuesto: 150),
    Categoria(id: 4, name: 'Educación', tipo: Tipo(id: 2, name: 'Gasto'), presupuesto: 200),
    Categoria(id: 5, name: 'Entretenimiento', tipo: Tipo(id: 2, name: 'Gasto'), presupuesto: 120),
    Categoria(id: 6, name: 'Ingresos adicionales', tipo: Tipo(id: 1, name: 'Ingreso'), presupuesto: 500),
    Categoria(id: 7, name: 'Ahorros futuros', tipo: Tipo(id: 3, name: 'Ahorro'), presupuesto: 300),
  ];

  void setSelectedTipo(Tipo? newValue) {
    selectedTipo.value = newValue;
  }
}