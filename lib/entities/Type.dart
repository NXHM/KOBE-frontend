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
    Iterable categories = [];
    if (json["Category"] != null) {
      categories = json["Category"];
    }
    return Type(
        id: json['id'] as int?,
        name: json['name'] as String,
        categories: categories.isEmpty
            ? []
            : List<Category>.from(
                categories.map((model) => Category.fromJson(model))));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categories': categories,
    };
  }
}
