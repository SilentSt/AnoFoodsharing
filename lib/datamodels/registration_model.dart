class RegistrationModel {
  final String fName;
  final String sName;
  final String city;
  final String address;
  final String phoneNum;
  final String email;
  final String password;

  RegistrationModel(this.fName,
      this.sName,
      this.city,
      this.address,
      this.phoneNum,
      this.email,
      this.password,);

  RegistrationModel.fromJson(Map<String, dynamic> json):
    fName = json['fName'],
    sName = json['sName'],
    city = json['city'],
    address = json['address'],
    phoneNum = json['phoneNum'],
    email = json['email'],
    password = json['password']
  ;

  Map<String, dynamic> toJson() =>
      {
        'fName': fName,
        'sName': sName,
        'city': city,
        'address':address,
        'phoneNum':phoneNum,
        'email':email,
        'password':password
      };
}
