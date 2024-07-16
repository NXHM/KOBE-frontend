import 'Category.dart';
import 'Month.dart';
import 'User.dart';

class Budget {
  int? id;
  double amount;
  int year;
  int categoryId;
  int monthId;
  int userId;

  // Relationships
  Category? category;
  Month? month;
  User? user;

  Budget({
    this.id,
    required this.amount,
    required this.year,
    required this.categoryId,
    required this.monthId,
    required this.userId,
    this.category,
    this.month,
    this.user,
  });

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'] as int?,
      amount: json['amount'] as double,
      year: json['year'] as int,
      categoryId: json['category_id'] as int,
      monthId: json['month_id'] as int,
      userId: json['user_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'year': year,
      'category_id': categoryId,
      'month_id': monthId,
      'user_id': userId,
    };
  }
}
