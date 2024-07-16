import 'Month.dart';
class Calendar {
  int? id;
  DateTime date;
  int monthId;

  // Relationship
  Month? month;

  Calendar({
    this.id,
    required this.date,
    required this.monthId,
    this.month,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      id: json['id'] as int?,
      date: DateTime.parse(json['date'] as String),
      monthId: json['month_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'month_id': monthId,
    };
  }
}
