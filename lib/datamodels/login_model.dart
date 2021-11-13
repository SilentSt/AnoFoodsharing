class LoginModel {
  final String login;
  final String password;
  String jwtToken;

  LoginModel(this.login, this.password, {this.jwtToken=""});

  LoginModel.fromJson(Map<String, dynamic> json)
      :jwtToken = json['jwt'],
        login = "",
        password = "";

  Map<String, dynamic> toJson() => {
        'name': login,
        'email': password,
      };
}
