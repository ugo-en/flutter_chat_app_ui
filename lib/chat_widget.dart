import 'package:chat_screen_ui/chat_screen.dart';
import 'package:chat_screen_ui/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatWidget extends StatelessWidget {

  String _contactName = "", _lastMsg = "", _displayPicture = "";
  int _unread = 0;
  bool _online = false;

  ChatWidget({Key? key, required String contactName, required String lastMsg, required String displayPicture, required int unread, required bool online}) : super(key: key){
    _contactName = contactName;
    _lastMsg = lastMsg;
    _displayPicture = displayPicture;
    _unread = unread;
    _online = online;
  }


  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              contactName: _contactName,
              displayPicture: _displayPicture,
              online: _online,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 15,
          left: 5,
          right: 5,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: bg(),
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: Wrap(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.15,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    backgroundImage: AssetImage(
                      _displayPicture,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width*0.7,
                  padding: EdgeInsets.only(
                    left: 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _contactName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: fg(),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          _unread<=0?
                          Icon(
                            Icons.check,
                            color: accentColor,
                          ):
                          SizedBox(),
                          Container(
                            margin: EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              _lastMsg,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: fg(),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.10,
                  child: _unread>0?
                  CircleAvatar(
                    backgroundColor: accentColor,
                    maxRadius: 12,
                    child: Text(
                      _unread.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ):
                  SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
