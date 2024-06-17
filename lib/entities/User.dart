// entities/User.dart

class User {
  int? id;
  String? name;
  String? password;
  String? username;
  String? email;
  String? tempCode;

  User({
    this.id,
    this.name,
    this.password,
    this.username,
    this.email,
    this.tempCode,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    username = json['username'];
    email = json['email'];
    tempCode = json['tempCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id; 
    data['name'] = name;
    data['password'] = password;
    data['username'] = username;
    data['email'] = email;
    data['tempCode'] = tempCode;
    return data;
  }
}
