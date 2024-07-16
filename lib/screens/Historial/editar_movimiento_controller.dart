import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../entities/Movimiento.dart';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';

import 'package:http/http.dart' as http;

class EditarMovimientoController extends GetxController {
  List<Categoria> categorias = [];
  RxBool loaded = false.obs;

  Future<void> getCategoria() async {
    try {
      final response = await http.post(
          Uri.parse(
              "http://localhost:3000/api/categoriasTipo/${selectedTipo.value!.id.toString()}"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRvcGVzIiwiaWF0IjoxNzIxMDIxMDYxLCJleHAiOjE3MjEwMjQ2NjF9.SvTIXqfg_qubsj9CvWGpQhvgfZXWYnkLwVFxRJ65SKg'
          });

      if (response.statusCode != 200) {
        print("Error obteniendo categorias");
        return;
      }

      print(response.body);

      loaded.value = true;
    } catch (e) {
      print("Error obteniendo categorias: $e");
    }
  }

  Rx<Tipo?> selectedTipo = Rx<Tipo?>(null);
  RxList<Tipo> tipos = <Tipo>[
    Tipo(id: 1, name: 'Ingreso'),
    Tipo(id: 2, name: 'Gasto'),
    Tipo(id: 3, name: 'Ahorro'),
  ].obs;

  void setSelectedTipo(Tipo? newValue) {
    selectedTipo.value = newValue;
    getCategoria();
  }
}
