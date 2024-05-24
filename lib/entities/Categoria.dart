import 'dart:convert';
import '../../entities/Tipo.dart';

class Categoria {
  int id;
  String name;
  Tipo tipo; // Clave foránea de la clase Tipo
  double presupuesto; // Añadir este campo

  Categoria({
    required this.id,
    required this.name,
    required this.tipo,
    required this.presupuesto, // Añadir este campo
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        name: json["name"],
        tipo: Tipo.fromJson(json["tipo"]),
        presupuesto: json["presupuesto"].toDouble(), // Añadir este campo
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tipo": tipo.toJson(),
        "presupuesto": presupuesto, // Añadir este campo
      };

  @override
  String toString() {
    return 'Categoria -> id: $id, name: $name, tipo: $tipo, presupuesto: $presupuesto'; // Añadir este campo
  }
}
