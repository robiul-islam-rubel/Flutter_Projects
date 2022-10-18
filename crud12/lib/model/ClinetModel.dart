class Note {
  late final String name;
  late final String id;
  late final String program;
  late final String cgpa;

  Note(
      {required this.name, required this.id, required this.program, required this.cgpa});

  Note.fromMap(Map<String, dynamic> map)
      :
        name=map["name"],
        id=map["id"],
        program=map["program"],
        cgpa=map["cgpa"];

  Map<String, dynamic> toMap() {
    var map =Map<String,dynamic>();
    map['name']=name;
    map['id']=id;
    map['program']=program;
    map['cgpa']=cgpa;
    return map;

  }
}