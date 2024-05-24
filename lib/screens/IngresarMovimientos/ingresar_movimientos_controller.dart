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
    Categoria(id: 1, name: 'Comida', tipo: Tipo(id: 2, name: 'Gasto')),
    Categoria(id: 2, name: 'Transporte', tipo: Tipo(id: 2, name: 'Gasto')),
    Categoria(id: 3, name: 'Salud', tipo: Tipo(id: 2, name: 'Gasto')),
    Categoria(id: 4, name: 'Educación', tipo: Tipo(id: 2, name: 'Gasto')),
    Categoria(id: 5, name: 'Entretenimiento', tipo: Tipo(id: 2, name: 'Gasto')),
    Categoria(id: 6, name: 'Ingresos adicionales', tipo: Tipo(id: 1, name: 'Ingreso')),
    Categoria(id: 7, name: 'Ahorros futuros', tipo: Tipo(id: 3, name: 'Ahorro')),
  ];

  void setSelectedTipo(Tipo? newValue) {
    selectedTipo.value = newValue;
  }
}

