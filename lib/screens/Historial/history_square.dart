import 'package:flutter/material.dart';
import 'package:myapp/entities/Tipo.dart'; // Asegúrate de que la ruta es correcta
import 'package:myapp/entities/Categoria.dart';
import 'package:myapp/screens/Historial/editar_movimiento_page.dart'; // Asegúrate de que la ruta es correcta

class HistorySquare extends StatelessWidget {
  final int id;
  final DateTime fecha;
  final Tipo tipo;
  final Categoria categoria;
  final double monto;

  HistorySquare({
    required this.id,
    required this.fecha,
    required this.tipo,
    required this.categoria,
    required this.monto,
  });

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
                  'Movimiento #$id',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => EditarMovimientoPage()));
                    },
                    icon: Icon(Icons.edit)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Fecha: $fecha'),
            const SizedBox(height: 8),
            Text('Tipo: ${tipo.name}'),
            const SizedBox(height: 8),
            Text('Categoria: ${categoria.name}'),
            const SizedBox(height: 8),
            Text('Monto: $monto'),
          ],
        ),
      ),
    );
  }
}
