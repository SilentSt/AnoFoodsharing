class UserDataModel {
  final String fName;
  final String sName;
  final String city;
  final String address;
  final String phoneNum;
  final String email;

  UserDataModel(this.fName,
      this.sName,
      this.city,
      this.address,
      this.phoneNum,
      this.email,);

  UserDataModel.fromJson(Map<String, dynamic> json):
        fName = json['fName'],
        sName = json['sName'],
        city = json['city'],
        address = json['address'],
        phoneNum = json['phoneNum'],
        email = json['email']
  ;

  Map<String, dynamic> toJson() =>
      {
        'fName': fName,
        'sName': sName,
        'city': city,
        'address':address,
        'phoneNum':phoneNum,
        'email':email,
      };
}
