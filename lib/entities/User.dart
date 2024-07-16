class User {
  int? id;
  String name;
  String username;
  String email;
  String password;

  // Relationships
  List<Movement>? movements;
  List<Category>? categories;
  List<Budget>? budgets;

  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    this.movements,
    this.categories,
    this.budgets,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
