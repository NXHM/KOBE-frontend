import 'package:flutter/material.dart';

class CategorySquare extends StatelessWidget {
  final String tipo;
  final List<Map<String, dynamic>> categorias;

  CategorySquare({required this.tipo, required this.categorias});

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
            Text(
              tipo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...categorias.map((categoria) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(categoria['category_name']),
                    Text(
                        "Presupuesto: ${categoria['amount']}"), // Mostrar el presupuesto como número
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
