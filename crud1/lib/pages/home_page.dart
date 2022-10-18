import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String Name,ID,Program;
  late double gpa;
  getName(name)
  {
    this.Name=name;
  }

  getID(ID)
  {
    this.Name=ID;
  }

  getProgram(program)
  {
    this.Program=program;
  }

  getStudentGPA(gpa)
  {
    this.gpa=gpa;
  }
  var name=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
        appBar: AppBar(
        title: Text("CRUD operations"),

    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,width: 2.0),

                    )
                  ),
                  onChanged: (String name){
                    getName(name);

                  }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "StudentID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0),

                      )
                  ),
                  onChanged: (String id){
                    getID(id);

                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "StudyProgram",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0),

                      )
                  ),
                  onChanged: (String program){
                    getProgram(program);

                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "CGPA",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,width: 2.0),

                      )
                  ),
                  onChanged: (String gpa){
                    getStudentGPA(gpa);

                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                ElevatedButton(
                  child: Text('Create'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    //createData();
                  },
                ),

                ElevatedButton(
                  child: Text('Read'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    //readData();
                  },
                ),

                ElevatedButton(
                  child: Text('Update'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    //updateData();
                  },
                ),

                ElevatedButton(
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    //deleteData();
                  },
                ),

              ],
            )

          ],

        ),

      ),
    );
  }
}
