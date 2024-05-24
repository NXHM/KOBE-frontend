// ignore: file_names
class UserModel {
  String? name;
  String? password;
  String? username;
  String? email;
  String? tempCode;

  UserModel({
    this.name,
    this.password,
    this.username,
    this.email,
    this.tempCode
  });

  UserModel.fromJson(Map<String, dynamic> json) {
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


