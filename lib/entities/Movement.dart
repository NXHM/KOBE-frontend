import 'Category.dart';
import 'User.dart';

class Movement {
  int? id;
  double? amount;
  String? detail;
  DateTime? date;

  // Relationships
  Category? category;
  User? user;

  Movement({
    this.id,
    required this.amount,
    this.detail,
    required this.date,
    this.category,
    this.user,
  });

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
        id: json['id'] as int?,
        amount: json['amount'] as double,
        detail: json['detail'] as String?,
        date: DateTime.parse(json['date'] as String),
        category: json["Category"] != null
            ? Category.fromJson(json["Category"])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'detail': detail,
      'date': date.toString(),
      'Category': category
    };
  }
}
