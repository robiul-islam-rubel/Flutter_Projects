import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappui/pages/call_screen.dart';
import 'package:whatsappui/pages/camera_sceen.dart';
import 'package:whatsappui/pages/chat_screen.dart';
import 'package:whatsappui/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>with TickerProviderStateMixin {
   late TabController _tabController;
  @override
  void initState()
  {
    _tabController=TabController(initialIndex: 1,length: 4, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff075E54),
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs:const <Widget> [
            Tab(icon: Icon(Icons.camera_alt_rounded),),
            Tab(text: "CHATS",),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",)
          ],

        ),
        actions:<Widget> [
          Icon(Icons.search),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 5),
      ),
        Icon(Icons.more_vert),
        ],

      ),
      body: TabBarView(
        controller: _tabController,
        children:<Widget> [
         CameraScreen(),
          //ChatScreen(),
          StatusScreen(),
          CallsScreen(),

        ],


      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message),
        onPressed: ()=>{
          print("Open Chats")

        }
      ),
    );
  }
}
