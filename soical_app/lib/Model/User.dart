class User {
  String name;
  String mail;
  String nationalId;
  String mobile;
  String area;
  String street;
  String building;
  String apartment;
  User(String name, String mail, String nationalId, String mobile, String area,
      String street, String building, String apartment) {
    this.name = name;
    this.mail = mail;
    this.nationalId = nationalId;
    this.mobile = mobile;
    this.area = area;
    this.street = street;
    this.building = building;
    this.apartment = apartment;
  }

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        mail = json['mail'],
        nationalId = json['nationalId'],
        mobile = json['mobile'],
        area = json['area'],
        street = json['street'],
        building = json['building'],
        apartment = json['apartment'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'mail': mail,
        'nationalId': nationalId,
        'mobile': mobile,
        'area': area,
        'street': street,
        'building': building,
        'apartment': apartment,
      };
}
