import 'package:flutter/material.dart';
import 'package:myapp/entities/Type.dart'; // Asegúrate de que la ruta es correcta
import 'package:myapp/entities/Category.dart';
import 'package:myapp/screens/Historial/editar_movimiento_page.dart';
import 'package:myapp/screens/Historial/historial_page.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:myapp/screens/Historial/historial_controller.dart';

import 'package:myapp/screens/Historial/history_square_controller.dart'; // Asegúrate de que la ruta es correcta

class HistorySquare extends StatefulWidget {
  final int id;
  final DateTime fecha;
  final String tipo;
  final String categoria;
  final double monto;

  HistorySquare({
    required this.id,
    required this.fecha,
    required this.tipo,
    required this.categoria,
    required this.monto,
  });

  @override
  State<HistorySquare> createState() => _HistorySquareState();
}

class _HistorySquareState extends State<HistorySquare> {
  HistorySquareController _controller = Get.put(HistorySquareController());
  HistorialController _controller2 = Get.put(HistorialController());

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color:
          Colors.white, // Establecer el color de fondo de la tarjeta a blanco
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Movimiento #${widget.id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) =>
                                  EditarMovimientoPage(id: widget.id)));
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, widget.id);
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Fecha: ${widget.fecha}'),
            const SizedBox(height: 8),
            Text('Tipo: ${widget.tipo}'),
            const SizedBox(height: 8),
            Text('Categoria: ${widget.categoria}'),
            const SizedBox(height: 8),
            Text('Monto: ${widget.monto}'),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Eliminación'),
          content:
              Text('¿Estás seguro de que quieres eliminar este movimiento?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _deleteMovement(id);
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMovement(int id) async {
    // Implementa tu lógica de eliminación aquí, como llamar a tu API backend
    print('Eliminando movimiento con id: $id');
    print(id);
    //Ejemplo: llamar a la API para eliminar el movimiento
    _controller.deleteMovement(id);
    _controller2.getHistorial();
  }
}
