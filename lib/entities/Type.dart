import 'Category.dart';
class Type {
  int? id;
  String name;

  // Relationship
  List<Category>? categories;

  Type({
    this.id,
    required this.name,
    this.categories,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['id'] as int?,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
