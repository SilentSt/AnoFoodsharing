class LoginModel {
  final String login;
  final String password;

  LoginModel(
    this.login,
    this.password,
  );

  LoginModel.fromJson(Map<String, dynamic> json)
      : login = json['name'],
        password = json['email'];

  Map<String, dynamic> toJson() => {
        'name': login,
        'email': password,
      };
}
