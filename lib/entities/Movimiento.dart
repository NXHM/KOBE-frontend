import 'dart:convert';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';
import '../../entities/User.dart'; 

class Movimiento {
  int id;
  DateTime fecha;
  Tipo tipo;
  Categoria categoria;
  double monto;
  String comentario;
  User usuario;

  Movimiento({
    required this.id,
    required this.fecha,
    required this.tipo,
    required this.categoria,
    required this.monto,
    required this.comentario,
    required this.usuario,
  });

  factory Movimiento.fromJson(Map<String, dynamic> json) => Movimiento(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        tipo: Tipo.fromJson(json["tipo"]),
        categoria: Categoria.fromJson(json["categoria"]),
        monto: json["monto"].toDouble(),
        comentario: json["comentario"],
        usuario: User.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha.toIso8601String(),
        "tipo": tipo.toJson(),
        "categoria": categoria.toJson(),
        "monto": monto,
        "comentario": comentario,
        "usuario": usuario.toJson(),
      };

  @override
  String toString() {
    return 'Movimiento -> id: $id, fecha: $fecha, tipo: $tipo, categoria: $categoria, monto: $monto, comentario: $comentario, usuario: $usuario';
  }
}
