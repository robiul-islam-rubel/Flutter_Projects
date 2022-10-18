import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../database/database_helper.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    refreshBooks();
    super.initState();
  }

  // Collect Data from DB
  List<Map<String, dynamic>> books = [];
  void refreshBooks() async {
    final data = await SQLHelper.getBooks();
    setState(() {
      books = data;
    });
  }
  late String chosenValue;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //print(books);
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Operation"),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) => Card(
            color: Colors.blue,
            margin: const EdgeInsets.all(15),
            child: ListTile(
              isThreeLine: true,
              title: Text(books[index]['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // height: 5,
                      fontSize: 20,
                      color: Color(0xFFFFFFFF))),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("by. " + books[index]['author'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFFFFFFFF))),
                  Text(books[index]['year'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 2,
                          color: Color(0xFFFFFFFF))),
                  Text(
                    books[index]['desc'],
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),


                ],

              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => modalForm(books[index]['id']),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () => deleteBook(books[index]['id']),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalForm(0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //Function -> Add
  Future<void> addBook() async {
    await SQLHelper.addBook(
        titleController.text,
        authorController.text,
        yearController.text,
        descController.text);
    titleController.text = '';
    authorController.text = '';
    yearController.text = '';
    descController.text = '';
    refreshBooks();
  }

  // Function -> Update
  Future<void> updateBooks(int id) async {
    await SQLHelper.updateBooks(id, titleController.text, authorController.text,
        yearController.text, descController.text);
    refreshBooks();
  }

  // Function -> Delete
  void deleteBook(int id) async {
    await SQLHelper.deleteBook(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Successfull Delete a Book")));
    refreshBooks();
  }


  //Form Add
  void modalForm(int id) async {
   /* final dataBooks = books.firstWhere((element) => element['id'] == id);
    titleController.text = dataBooks['title'];
    authorController.text = dataBooks['author'];
    yearController.text = dataBooks['year'];
    descController.text = dataBooks['desc'];

    */

    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: 800,
          child: SingleChildScrollView(
            //reverse: true,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                   // key: _formkey,
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                    validator: (val)
                      {
                        if(val==null||val.isEmpty)
                          {
                            return "Enter title";
                          }

                        return null;

                      }
                  ),


                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: authorController,
                    decoration: const InputDecoration(hintText: 'Author'),
                      validator: (val)
                      {
                        if(val==null||val.isEmpty)
                        {
                          return "Enter Author";
                        }

                        return null;

                      }
                  ),
                  Container(
                    child: TextFormField(
                       controller: yearController,
                      decoration:
                      InputDecoration(
                        icon: Icon(Icons.calendar_month),
                        labelText: "Select a data"


                      ),
                      onTap: () async{
                         DateTime? pickeddate=await showDatePicker(
                           context: context,
                           initialDate: DateTime.now(),
                           firstDate: DateTime(2000),
                           lastDate: DateTime(2030));
                         if(pickeddate!=null)
                           {
                             setState(() {
                               yearController.text= DateFormat('yyyy-MM-dd').format(pickeddate);
                             });
                           }

                      },
                        validator: (val)
                        {
                          if(val==null||val.isEmpty)
                          {
                            return "Enter Descriptions";
                          }

                          return null;

                        }


                    ),
                  ),
                  TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(hintText: 'Desc'),
                      validator: (val)
                      {
                        if(val==null||val.isEmpty)
                        {
                          return "Enter Descriptions";
                        }

                        return null;

                      }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 /* DropdownSearch<String>(

                    popupProps: PopupProps.dialog(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada',"Dhaka","Dilhi","Kolkata","Thimpu"],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select one",
                        hintText:"This is menu",
                      ),
                    ),
                    onChanged: print,
                    selectedItem: "Brazil",
                  ),

                  */
                  ElevatedButton(
                      onPressed: () async {

                        if (id == 0)
                        {
                          if(_formkey.currentState!.validate())
                          {


                           await addBook();
                            return Navigator.pop(context);
                          }

                          if(titleController.text.isEmpty)
                            {
                              //toast("title");
                              return;
                            }
                           if(authorController.text.isEmpty)
                          {
                            //toast("author");
                            return;
                          }

                           if(descController.text.isEmpty)
                          {
                            //toast("desc");
                            return;
                          }

                          await addBook();


                           //toast("Rubel");
                        }
                        else
                        {
                          await updateBooks(id);
                        }


                        titleController.text = '';
                        authorController.text = '';
                        yearController.text = '';
                        descController.text = '';

                       ///ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Processing')));
                      },
                      child: Text(id == 0 ? 'Add' : 'Update')
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


