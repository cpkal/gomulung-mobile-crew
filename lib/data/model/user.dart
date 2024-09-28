class User {
  String? name;
  String? email;
  String? password;
  String? token;

  User({this.name, this.email, this.password, this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    return data;
  }
}
