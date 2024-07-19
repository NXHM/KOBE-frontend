import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/Historial/historial_controller.dart';
import 'package:myapp/screens/Historial/history_square.dart';

class HistorialPage extends StatefulWidget {
  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  HistorialController controller = Get.put(HistorialController());

  @override
  void initState() {
    super.initState();
    controller.getHistorial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Obx(() {
        if (controller.loaded.value) {
          if (controller.historialMovimientos.isEmpty) {
            return Center(child: Text("No hay movimientos."));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: controller.historialMovimientos.length,
                itemBuilder: (context, index) {
                  var movimiento = controller.historialMovimientos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: HistorySquare(
                      id: movimiento['id'],
                      fecha: DateTime.parse(movimiento['date']),
                      tipo: movimiento['typeName'],
                      categoria: movimiento['categoryName'],
                      monto: movimiento['amount'],
                    ),
                  );
                },
              ),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
