import 'Budget.dart';
import 'Movement.dart';
import 'Type.dart';
import 'User.dart';

class Category {
  int? id;
  String name;
  int typeId;
  int userId;

  // Relationships
  Type? type;
  User? user;
  List<Movement>? movements;
  List<Budget>? budgets;

  Category({
    this.id,
    required this.name,
    required this.typeId,
    required this.userId,
    this.type,
    this.user,
    this.movements,
    this.budgets,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'] as int?,
        name: json['name'] as String,
        typeId: json['type_id'] as int,
        userId: json['user_id'] as int,
        type: json["Type"] != null ? Type.fromJson(json["Type"]) : null);
  }

  factory Category.fromJson2(Map<String, dynamic> json) {
    return Category(
        id: json['id'] as int?,
        name: json['name'] as String,
        typeId: json['type_id'] as int,
        userId: json['user_id'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type_id': typeId,
      'user_id': userId,
      "Type": type,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }
}
