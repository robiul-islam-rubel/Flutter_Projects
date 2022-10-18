 import 'package:demo/model/album.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

   @override
   State<HomeScreen> createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {

   late Future<Album> futureAlbum;


   @override
   Widget build(BuildContext context) {

     return Scaffold(

       body: Container(

         child: ListView.separated(
           itemCount: 5,
           separatorBuilder: (BuildContext context, int index) => const Divider(),
           itemBuilder: (BuildContext context, int index) {
             return Column(
               children: [
                 ListTile(

                   title: Center(child: Text("Rubel")),


                 ),

               ],
             );


           },

         )
         )


     );
   }
 }
