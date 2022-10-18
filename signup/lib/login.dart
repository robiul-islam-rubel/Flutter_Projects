import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
   const MyLogin({Key? key}) : super(key: key);

   @override
   State<MyLogin> createState() => _MyLoginState();
 }

 class _MyLoginState extends State<MyLogin> {
   @override
   Widget build(BuildContext context) {
     return Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/login.png'),
           fit: BoxFit.cover,

         )


       ),
       child: Scaffold(
         backgroundColor: Colors.transparent,
         body: Stack(
           children: [
             Container(
               padding: EdgeInsets.only(left: 35,top: 140),
               child: Text("Welcome\nBack",style: TextStyle(
                 color: Colors.blue,
                 fontSize: 33
               ),),
             ),
             SingleChildScrollView(
               child: Container(
                 padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
                 child: Column(
                   children: [
                     TextField(
                       decoration: InputDecoration(
                         fillColor: Colors.blue.shade100,
                         filled: true,
                         hintText: 'Email',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30)
                         )
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     TextField(
                       obscureText: true,
                       decoration: InputDecoration(

                           fillColor: Colors.redAccent.shade100,
                           filled: true,
                           hintText: 'Password',

                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(30)
                           )
                       ),
                     ),
                     SizedBox(
                       height: 40,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text('Sign In',style: TextStyle(
                           fontSize: 27,fontWeight:FontWeight.w700
                         ),
                         ),
                         CircleAvatar(
                           radius: 30,
                           backgroundColor: Colors.black,
                           child: IconButton(
                             onPressed: (){},
                             icon: Icon(Icons.arrow_forward),
                           ),

                         )
                       ],
                     ),
                     SizedBox(
                       height: 40,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 40),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           TextButton(onPressed: () {
                             Navigator.pushNamed(context, 'registar');
                           }, child: Text('Sign Up',style: TextStyle(
                             decoration: TextDecoration.underline,
                             fontSize: 16,
                             color: Colors.blue.shade500

                           )
                           )


                           ),
                           TextButton(onPressed: () {}, child: Text('Forget Password',style: TextStyle(
                               decoration: TextDecoration.underline,
                               fontSize: 16,
                               color: Colors.blue.shade500

                           )
                           )


                           )

                         ],
                       ),
                     )

                   ],
                 ),

               ),
             )
           ],
         ),

       ),
     );
   }
 }
