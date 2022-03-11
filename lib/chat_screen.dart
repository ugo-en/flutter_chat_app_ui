import 'package:chat_screen_ui/items.dart';
import 'package:chat_screen_ui/msg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  String _contactName = "", _displayPicture = "";
  bool _online = false;

  ChatScreen({Key? key, required String contactName, required String displayPicture, required bool online}) : super(key: key){
    _contactName = contactName;
    _displayPicture = displayPicture;
    _online = online;
  }

  @override
  _ChatScreenState createState() => _ChatScreenState(
    contactName: _contactName,
    displayPicture: _displayPicture,
    online: _online,
  );
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _msgController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  List<Widget> _messages = [];

  String _contactName = "", _displayPicture = "";
  bool _online = false;

  _ChatScreenState({required String contactName, required String displayPicture, required bool online}){
    _contactName = contactName;
    _displayPicture = displayPicture;
    _online = online;
  }

  _addMsg(String text, bool isUserMsg){
    setState(() {
      DateTime now = DateTime.now();
      _messages.add(
        MsgWidget(
          text: text,
          date: "${now.hour}:${now.minute}",
          isUserMsg: isUserMsg,
        ),
      );
    });
  }

  _send(){
    String text = _msgController.text.trim();
    if (text.isNotEmpty){
      _addMsg(text, true);
      _addMsg("This ia a sample response!", false);
    }
    else{
      print("Please enter a message!");
    }
    _msgController.text = "";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg(),
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              CircleAvatar(
                minRadius: 15,
                maxRadius: 15,
                backgroundImage: AssetImage(
                  _displayPicture,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                ),
                child: Column(
                  children: [
                    Text(
                      _contactName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _online?"online":"offline",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.video_call,
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
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: _messages.length,
            shrinkWrap: true,
            controller: _scrollController,
            padding: EdgeInsets.only(top: 10,bottom: 70),
            physics: ScrollPhysics(),
            itemBuilder: (context, index){
              return _messages[index];//
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: bg(),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.85,
//                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: TextField(
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                          color: fg(), //Colors.black,//getTextColor(Theme.of(context)),
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          filled: false,
                          fillColor: null,
                          contentPadding: EdgeInsets.fromLTRB(5.0 , 10.0 , 5.0 , 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: fg(),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: accentColor,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: accentColor,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: "Write message...",
                          hintStyle: TextStyle(
                              color: fg(),
                          ),
                        ),
                        controller: _msgController,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () => _send(),
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: accentColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
