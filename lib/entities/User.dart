// ignore: file_names
class User {
  String? name;
  String? password;
  String? username;
  String? email;
  String? tempCode;

  User({
    this.name,
    this.password,
    this.username,
    this.email,
    this.tempCode
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    username = json['username'];
    email = json['email'];
    tempCode = json['tempCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['username'] = username;
    data['email'] = email;
    data['tempCode'] = tempCode;
    return data;
  }
}


