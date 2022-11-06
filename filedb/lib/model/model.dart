import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Employee {
  String FirstName;
  String LastName;
  Employee({required this.FirstName,required this.LastName});


  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
   FirstName:json["Firstname"],
    LastName:json["LastName"]
  );

  Map<String, dynamic> toJson() => {
    "FirstName":FirstName,
    "LastName":LastName

  };
}