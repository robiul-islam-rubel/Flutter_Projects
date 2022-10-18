class user {
  int? id;
  String? name;
  String? username;
  String? email;

  user({this.name, this.id, this.username, this.email});

  user.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}