import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/Historial/historial_controller.dart';
import 'package:myapp/screens/Historial/history_square.dart';
import 'package:myapp/screens/Overview/components/period_selector.dart';
import 'package:myapp/screens/components/category_square.dart';
import 'package:myapp/entities/Type.dart';
//import 'viewCategories.dart'; // Importa la página ViewCategoriesPage

class HistorialPage extends StatefulWidget {
  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  HistorialController controller = Get.put(HistorialController());

  void changeMonth(int m) {
    setState(() {
      month = m;
    });
  }

  void changeYear(int y) {
    setState(() {
      year = y;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.getHistorial().then((_) {
      print(controller.historialMovimientos);
    });
    // print(controller.historialMovimientos[0].id!);
    // print(controller.historialMovimientos);
    print("por que la vida es asi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loaded.value
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.historialMovimientos.length,
                    itemBuilder: (context, index) {
                      // var movimiento = controller.historialMovimientos[index];
                      // var fecha = movimiento.date;
                      // var tipo =
                      //     movimiento.category?.type?.name ?? 'Tipo desconocido';
                      // var categoria =
                      //     movimiento.category?.name ?? 'Categoría desconocida';
                      // var monto = movimiento.amount ?? 0.0;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: HistorySquare(
                          id: controller.historialMovimientos[index].id!,
                          fecha: controller.historialMovimientos[index].date!,
                          tipo: controller
                              .historialMovimientos[index].category!.type!.name,
                          categoria: controller
                              .historialMovimientos[index].category!.name,
                          monto: controller.historialMovimientos[index].amount!,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : CircularProgressIndicator());
  }
}
