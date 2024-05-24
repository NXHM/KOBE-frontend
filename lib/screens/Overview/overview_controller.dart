import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import './overview_page.dart';

class OverviewController extends GetxController {
  List<List<List<Map<String, dynamic>>>> data = [
    [
      [
        {"col1": "Sueldo", "real": 1400, "planeado": 1400,},
        {"col1": "Dividendos", "real": 40, "planeado": 40,},
      ],
      [
        {"col1": "Comida", "real": 240, "planeado": 240,},
        {"col1": "Entretenimento", "real": 199, "planeado": 199,},
        {"col1": "Ropa", "real": 300, "planeado": 300,},
      ],
      [
        {"col1": "Departamento", "real": 800, "planeado": 800,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 1400, "planeado": 1400,},
        {"col1": "Dividendos", "real": 40, "planeado": 40,},
      ],
      [
        {"col1": "Comida", "real": 240, "planeado": 240,},
        {"col1": "Entretenimento", "real": 199, "planeado": 199,},
        {"col1": "Ropa", "real": 300, "planeado": 300,},
      ],
      [
        {"col1": "Departamento", "real": 800, "planeado": 800,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 1400, "planeado": 1400,},
        {"col1": "Dividendos", "real": 40, "planeado": 40,},
      ],
      [
        {"col1": "Comida", "real": 240, "planeado": 240,},
        {"col1": "Entretenimento", "real": 199, "planeado": 199,},
        {"col1": "Ropa", "real": 300, "planeado": 300,},
      ],
      [
        {"col1": "Departamento", "real": 800, "planeado": 800,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 1400, "planeado": 1400,},
        {"col1": "Dividendos", "real": 40, "planeado": 40,},
      ],
      [
        {"col1": "Comida", "real": 240, "planeado": 240,},
        {"col1": "Entretenimento", "real": 199, "planeado": 199,},
        {"col1": "Ropa", "real": 300, "planeado": 300,},
      ],
      [
        {"col1": "Departamento", "real": 800, "planeado": 800,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 736, "planeado": 1400,},
        {"col1": "Dividendos", "real": 37, "planeado": 40,},
      ],
      [
        {"col1": "Comida", "real": 130, "planeado": 240,},
        {"col1": "Entretenimento", "real": 37, "planeado": 199,},
        {"col1": "Ropa", "real": 51, "planeado": 300,},
      ],
      [
        {"col1": "Departamento", "real": 325, "planeado": 800,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
    [
      [
        {"col1": "Sueldo", "real": 0, "planeado": 100,},
        {"col1": "Dividendos", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Comida", "real": 0, "planeado": 100,},
        {"col1": "Entretenimento", "real": 0, "planeado": 100,},
        {"col1": "Ropa", "real": 0, "planeado": 100,},
      ],
      [
        {"col1": "Departamento", "real": 0, "planeado": 100,},
      ],
    ],
  ];
}