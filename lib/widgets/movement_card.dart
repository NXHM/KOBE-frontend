import 'package:flutter/material.dart';
//import '../screens/edit_movement.dart';
//import 'delete_confirmation_dialog.dart';

class MovementCard extends StatelessWidget {
  final int id;
  final String date;
  final String type;
  final String category;
  final int amount;
  final String comment;

  MovementCard({
    required this.id,
    required this.date,
    required this.type,
    required this.category,
    required this.amount,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Movimiento #$id'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fecha: $date'),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
            Text('Tipo: $type'),
            Text('Categoría: $category'),
            Text('Monto: $amount'),
            Text('Comentario: $comment'),
          ],
        ),
      ),
    );
  }
}
