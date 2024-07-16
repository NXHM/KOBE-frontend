class Month {
  int? id;
  String name;

  // Relationships
  List<Calendar>? calendars;
  List<Budget>? budgets;

  Month({
    this.id,
    required this.name,
    this.calendars,
    this.budgets,
  });

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(
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
