import 'dart:convert';

Tipo tipoFromJson(String str) => Tipo.fromJson(json.decode(str));
String tipoToJson(Tipo data) => json.encode(data.toJson());

class Tipo {
  int id;
  String name;

  Tipo({
    required this.id,
    required this.name,
  });

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return 'Tipo -> id: ${id}, name: ${this.name}';
  }
}
