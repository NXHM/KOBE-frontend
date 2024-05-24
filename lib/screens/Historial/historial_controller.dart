import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../entities/Movimiento.dart';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';

class HistorialController extends GetxController {
  var movimientos = <Movimiento>[
    Movimiento(
        id: 1,
        fecha: DateTime.now(),
        tipo: Tipo(id: 1, name: 'Ingreso'),
        categoria: Categoria(
            id: 1,
            name: 'Comida',
            tipo: Tipo(id: 2, name: 'Gasto'),
            presupuesto: 240),
        monto: 100.0,
        comentario: 'Ingreso de prueba'),
  ].obs;

  var editingMovimiento = Rx<Movimiento?>(null);
  final formKey = GlobalKey<FormState>();

  Rx<Tipo?> selectedTipo = Rx<Tipo?>(null);
  List<Tipo> tipos = [
    Tipo(id: 1, name: 'Ingreso'),
    Tipo(id: 2, name: 'Gasto'),
    Tipo(id: 3, name: 'Ahorro'),
  ];
  List<Categoria> categorias = [
    Categoria(
        id: 1,
        name: 'Comida',
        tipo: Tipo(id: 2, name: 'Gasto'),
        presupuesto: 240),
    Categoria(
        id: 2,
        name: 'Transporte',
        tipo: Tipo(id: 2, name: 'Gasto'),
        presupuesto: 100),
    Categoria(
        id: 3,
        name: 'Salud',
        tipo: Tipo(id: 2, name: 'Gasto'),
        presupuesto: 150),
    Categoria(
        id: 4,
        name: 'Educación',
        tipo: Tipo(id: 2, name: 'Gasto'),
        presupuesto: 200),
    Categoria(
        id: 5,
        name: 'Entretenimiento',
        tipo: Tipo(id: 2, name: 'Gasto'),
        presupuesto: 120),
    Categoria(
        id: 6,
        name: 'Ingresos adicionales',
        tipo: Tipo(id: 1, name: 'Ingreso'),
        presupuesto: 500),
    Categoria(
        id: 7,
        name: 'Ahorros futuros',
        tipo: Tipo(id: 3, name: 'Ahorro'),
        presupuesto: 300),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some dummy data
    movimientos.addAll([
      Movimiento(
          id: 37,
          fecha: DateTime.now(),
          tipo: tipos[2],
          categoria: categorias[6],
          monto: 40,
          comentario: 'Lorem ipsum'),
      Movimiento(
          id: 38,
          fecha: DateTime.now(),
          tipo: tipos[1],
          categoria: categorias[0],
          monto: 25,
          comentario: 'Lorem ipsum'),
      Movimiento(
          id: 39,
          fecha: DateTime.now(),
          tipo: tipos[1],
          categoria: categorias[1],
          monto: 12,
          comentario: 'Lorem ipsum'),
    ]);
  }

  void setEditingMovimiento(Movimiento movimiento) {
    editingMovimiento.value = movimiento;
  }

  void updateMovimiento() {
    movimientos[editingMovimiento.value!.id - 1] = editingMovimiento.value!;
    movimientos.refresh();
  }

  void deleteMovimiento(int id) {
    movimientos.removeWhere((movimiento) => movimiento.id == id);
  }

  void setSelectedTipo(Tipo? newValue) {
    selectedTipo.value = newValue;
  }
}
