import 'dart:convert';
import '../../entities/Tipo.dart';

class Categoria {
  int id;
  String name;
  Tipo tipo; // Clave foránea de la clase Tipo

  Categoria({
    required this.id,
    required this.name,
    required this.tipo,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        name: json["name"],
        tipo: Tipo.fromJson(json["tipo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tipo": tipo.toJson(),
      };

  @override
  String toString() {
    return 'Categoria -> id: $id, name: $name, tipo: $tipo';
  }
}
