class Contact {
  int? id;
  String name;
  String email;
  String mobile;
  String password;

  Contact({this.id, required this.name, required this.email,required this.mobile,required this.password});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "password" :password
  };
}