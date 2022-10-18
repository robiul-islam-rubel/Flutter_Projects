import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc/Controller/main_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final Controller _con =  Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVC Pattern Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                onPressed: () {

                      setState(() {
                        _con.decC();

                      });





                 // _con.decrementCounter();

                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
                Text(
                _con!=null?
                '${_con.counter}':"hi",


                //style: Theme.of(context).textTheme.display1,
              ),






                FloatingActionButton(
                onPressed: () {
                  //Text("Add");

                      setState(() {

                        _con.inC();

                      });




                  //_con.incrementCounter();

                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              ],
            ),
           // Text("this is test")
          ],



        ),
      ),
    );
  }
}
