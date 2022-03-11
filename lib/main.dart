import 'package:chat_screen_ui/chat_widget.dart';
import 'package:chat_screen_ui/items.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: accentColor,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _chats = [];

  void _loadChats(){
    _chats = [];

    List<List<dynamic>> msgs = [
      ["Vivian","You forgot the keys","assets/img/423149.jpg",2,true],
      ["John Bull","How are you?","assets/img/739812.jpg",0,false],
      ["Femi","Did the teacher give us work to do?","assets/img/884139.jpg",3,false],
      ["Anita","You forgot the keys","assets/img/857335.jpg",1,true],
      ["Baby 😍😍😍","I love you","assets/img/423149.jpg",0,false],
      ["Jonathan","You forgot the keys","assets/img/pic1.jpeg",0,true],
      ["Mum","God will be with you","assets/img/884139.jpg",2,true],
      ["Ugo","Thanks for designing the UI","assets/img/aesth.jpg",1,false],
      ["Fatima","Watch Interstellar 🤩","assets/img/black.jpg",4,true],
      ["Susan","You forgot the car!","assets/img/884139.jpg",0,false],
    ];

    for (int i = 0; i < msgs.length; i++){
      List<dynamic> element = msgs[i];

      _chats.add(
          ChatWidget(
            contactName: element[0],
            lastMsg: element[1],
            displayPicture: element[2],
            unread: element[3],
            online: element[4],
          )
      );
    }
  }

  Widget build(BuildContext context) {
    _loadChats();

    return Scaffold(
      backgroundColor: bg(),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              setState((){
                themeName = themeName=="light"?"dark":"light";
                _loadChats();
              });
            },
            icon: Icon(
              themeName=="light"?Icons.wb_sunny_outlined:Icons.nightlight_round,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bg(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: _chats,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New Message',
        onPressed: (){},
        child: Icon(
          Icons.sms_rounded,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
