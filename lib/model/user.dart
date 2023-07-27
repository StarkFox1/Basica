class User {
  final String uid;
  final String name;
  final String mail;
  final String PhoneNo;

  User(
      {this.uid = '',
      required this.name,
      required this.mail,
      required this.PhoneNo});

  static User fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], mail: json['email'], PhoneNo: json['phoneNo']);
}
