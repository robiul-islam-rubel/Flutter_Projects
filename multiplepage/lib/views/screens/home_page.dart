import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                //child: Text("Welcome"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: ElevatedButton(
                child: Text("Go to SignUp"),
                onPressed: ()
                  {
                    Navigator.pushNamed(context, '/registration');

                  }
              ),
            ),

          ],

        ),
      ),
    );
  }
}
